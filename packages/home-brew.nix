{ pkgs, nix-homebrew, ... }:
{
  nix-homebrew.autoMigrate = true;
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
      "git-crypt"
      "cmake"
    ];
    casks = [
      "font-geist-mono-nerd-font"
      "font-hack-nerd-font"
      "font-meslo-for-powerlevel10k"
      "adobe-acrobat-reader"
      "amazon-q"
      "dbeaver-community"
      "docker"
      "disk-drill"
      "figma@beta"
      "ghostty"
      "google-chrome"
      "logi-options+"
      "1password"
      "1password-cli"
      "macs-fan-control"
      "menumeters"
      "microsoft-teams"
      "notion"
      "raycast"
      "adapter"
      "postman"
      "proxyman"
      "tailscale"
      "rustdesk"
      "runjs"
      "whatsapp@beta"
      "nordvpn"
      "blender"
      "visual-studio-code"
      "cursor"
      "slack@beta"
    ];
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
