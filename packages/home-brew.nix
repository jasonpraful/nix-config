{ pkgs, nix-homebrew, ... }:
{
  nix-homebrew.autoMigrate = true;
  homebrew = {
    enable = true;
    taps = [
      "moul/moul"
      "oven-sh/bun"
      "hashicorp/tap"
      "teamookla/speedtest"
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
      "speedtest"
      "opencode"
    ];
    casks = [
      "font-geist-mono-nerd-font"
      "font-hack-nerd-font"
      "font-meslo-for-powerlevel10k"
      "adobe-acrobat-reader"
      "amazon-q"
      "comet"
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
      "opencode-desktop"
      "raycast"
      "adapter"
      "postman"
      "proxyman"
      "tailscale-app"
      "rustdesk"
      "runjs"
      "superwhisper"
      "whatsapp@beta"
      "nordvpn"
      "blender"
      "visual-studio-code"
      "cursor"
      "slack@beta"
      "teamviewer"
      "antigravity"
      "claude"
      "Superhuman"
    ];
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    masApps = {
      "XCode" = 497799835;
      "RarExtractor" = 1071663619;
      "Pages" = 409201541;
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "1PW Safari" = 1569813296;
    };
  };
}
