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
      "font-geist-mono-nerd-font"
      "font-hack-nerd-font"
      "font-meslo-for-powerlevel10k"
      "kiro-cli"
      "comet"
      "dbeaver-community"
      "discord"
      "docker-desktop"
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
      "runjs"
      "wispr-flow"
      "whatsapp@beta"
      "nordvpn"
      "blender"
      "visual-studio-code"
      "cursor"
      "slack@beta"
      "steipete/tap/codexbar"
      "teamviewer"
      "antigravity"
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
