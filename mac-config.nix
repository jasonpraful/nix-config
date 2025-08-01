{ pkgs
, config
, lib
, machine
, home-manager
, ...
}@inputs:
{
  imports = [
    home-manager.darwinModules.home-manager
    # (
    #   { pkgs, config, inputs, ... }:
    #   {
    #     home-manager.sharedModules = [
    #       mac-app-util.homeManagerModules.default
    #     ];
    #   }
    # )
  ];

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
  };
  programs.zsh.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      sandbox = false;
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
  security.pam.services.sudo_local.touchIdAuth = true;
  system.primaryUser = "jasonpraful";
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
      persistent-apps = [
        "/System/Applications/Launchpad.app"
        "/Applications/Arc.app"
        "/System/Applications/Messages.app"
        "/System/Applications/Calendar.app"
        "/System/Applications/Facetime.app"
        "/System/Applications/Notes.app"
        "/System/Applications/App Store.app"
        "/Applications/WhatsApp.app"
        "${machine.homedir}/Applications/Home Manager Trampolines/Obsidian.app"
        "${machine.homedir}/Applications/Home Manager Trampolines/Visual Studio Code.app"
        "${machine.homedir}/Applications/Home Manager Trampolines/iTerm2.app"
        "/System/Applications/System Settings.app"
      ];
    };

  };
  power = {
    sleep = {
      display = 15;
    };
  };

  system.stateVersion = 5;




  system.activationScripts.activateSettings.text = ''
    apps_source="${config.system.build.applications}/Applications"
    moniker="Nix Trampolines"
    app_target_base="$HOME/Applications"
    app_target="$app_target_base/$moniker"
    echo "Copying applications from $apps_source to $app_target"
    mkdir -p "$app_target"
    ${pkgs.rsync}/bin/rsync --archive --checksum --chmod=-w --copy-unsafe-links --delete "$apps_source/" "$app_target"

    echo "Copying SSH config from ${./assets/ssh} to $HOME/.ssh"
    mkdir -p "$HOME/.ssh"
    sudo ${pkgs.rsync}/bin/rsync --archive --checksum --chmod=600 "${./assets/ssh}/" "$HOME/.ssh/"
    sudo find "$HOME/.ssh/" -type f -exec sudo chmod 600 {} \;
    sudo chmod 700 "$HOME/.ssh"
    sudo chown -R ${machine.username}:staff "$HOME/.ssh/"
    echo "SSH config permissions set to 600 and directory to 700"
    echo "Post User Activation scripts completed successfully"
  '';

}
