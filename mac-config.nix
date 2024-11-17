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
  programs.zsh.enable = true; # default shell on catalina

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ "root" machine.username ];

    };
  };


  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "GeistMono" ]; })
  ];


  networking.hostName = machine.hostname;
  users.users.${machine.username}.home = machine.homedir;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users."${machine.username}" = {
      imports = [ "./home.nix" ];
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
      tilesize = 40;
      magnification = true;
      orientation = "bottom";
      mineffect = "genie";
      enable-spring-load-actions-on-all-items = true;
      minimize-to-application = false;
      show-process-indicators = true;
      show-recents = true;
    };

  };
}
