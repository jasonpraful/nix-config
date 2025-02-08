{ pkgs, nix-homebrew, ... }:
{
  homebrew = {
    enable = true;
    taps = [
      "moul/moul"
      "oven-sh/bun"
    ];
    brews = [
      "mongodb-atlas-cli"
      "postgresql@14"
      "totp-keychain"
      "mas"
      "bun"
    ];
    casks = [
      "font-geist-mono-nerd-font"
      "font-hack-nerd-font"
      "amazon-q"
      "docker"
      "disk-drill"
      "logi-options+"
      "1password"
      "1password-cli"
      "menumeters"
      "microsoft-office"
      "notion"
      "raycast"
      "adapter"
      "proxyman"
      "tailscale"
      "rustdesk"
      "runjs"
      "whatsapp@beta"
      "nordvpn"
      "blender"
      "balenaetcher"
    ];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    masApps = {
      "XCode" = 497799835;
      "RarExtractor" = 1071663619;
      "Pages" = 409201541;
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "iMovie" = 408981434;
      "1PW Safari" = 1569813296;
    };
  };
}
