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
      "ffmpeg"
      "gh"
      "readline"
      "xz"
      "terraform-ls"
      "git-crypt"
      "cmake"
      "speedtest"
      "opencode"
      "openai-whisper"
      "pass"
      "fastlane"
      "swiftformat"
      "cocoapods"
    ];
    casks = [
      "android-studio"
      "font-geist-mono-nerd-font"
      "font-hack-nerd-font"
      "font-meslo-for-powerlevel10k"
      "dbeaver-community"
      "discord"
      "docker-desktop"
      "disk-drill"
      "figma@beta"
      "ghostty"
      "google-chrome"
      "helium-browser"
      "logi-options+"
      "1password"
      "1password-cli"
      "macs-fan-control"
      "menumeters"
      "microsoft-teams"
      "raycast"
      "adapter"
      "postman"
      "proxyman"
      "tailscale-app"
      "runjs"
      "wispr-flow"
      "whatsapp@beta"
      "blender"
      "visual-studio-code"
      "cursor"
      "slack@beta"
      "teamviewer"
      "claude"
      "Superhuman"
      "iterm2"
    ];
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    masApps = {
    };
  };
}
