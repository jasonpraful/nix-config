{ pkgs
, config
, machine
, home-manager
, ...
}@inputs:
{
  imports = [ (home-manager.darwinModules.home-manager) ];

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
  };

  services.nix-daemon.enable = true;
  programs.zsh.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ "root" machine.username ];

    };
  };

  networking.hostName = machine.hostname;
  users.users.${machine.username}.home = machine.homedir;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users."${machine.username}" = {
      imports = [ ./home.nix ];
    };
    extraSpecialArgs = {
      inherit machine;
    };
  };


  time = {
    timeZone = "Europe/London";
  };
  security.pam.enableSudoTouchIdAuth = true;
  system.defaults = {
    trackpad.Clicking = true;
    loginwindow.GuestEnabled = false;
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      AppleKeyboardUIMode = 3; # full control
    };
    finder = {
      AppleShowAllExtensions = true;
      _FXShowPosixPathInTitle = true;
    };
    WindowManager = {
      EnableStandardClickToShowDesktop = true;
    };
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.5;
      tilesize = 40;
      magnification = true;
      orientation = "bottom";
      mineffect = "genie";
      minimize-to-application = false;
      show-process-indicators = true;
      show-recents = true;
    };

  };
  power = {
    sleep = {
      display = 15;
    };
  };

  system.stateVersion = 5;


  system.activationScripts.applications.text =
    let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
    pkgs.lib.mkForce ''
      # Code from Gist: https://gist.github.com/elliottminns/211ef645ebd484eb9a5228570bb60ec3
      # Converts all symlinks in /Applications to hard links
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';
}
