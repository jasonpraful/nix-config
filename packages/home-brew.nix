{ pkgs, nix-homebrew, ... }:
{
  homebrew = {
    enable = true;
    taps = [
      "moul/moul"
      "oven-sh/bun"
      "hashicorp/tap"
   ];
    brews = [
      "mongodb-atlas-cli"
      "postgresql@14"
      "totp-keychain"
      "mas"
      "bun"
      "readline"
      "xz"
      "terraform-ls"
      "cmake"
    ];
    casks = [
      "font-geist-mono-nerd-font"
      "font-hack-nerd-font"
      "adobe-acrobat-reader"
      "amazon-q"
      "docker"
      "disk-drill"
      "google-chrome"
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
      "visual-studio-code"
      "cursor"
    ];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    masApps = {
      "Okta Verify" = 490179405;
      "XCode" = 497799835;
      "RarExtractor" = 1071663619;
      "Pages" = 409201541;
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "1PW Safari" = 1569813296;
    };
  };
}
