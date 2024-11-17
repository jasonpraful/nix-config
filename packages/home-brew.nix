{ pkgs, nix-homebrew, ... }:
{
  homebrew = {
    enable = true;
    taps = [
      "moul/moul"
    ];
    brews = [
      "mongodb-atlas-cli"
      "postgresql@14"
      "totp-keychain"
    ];
    casks = [
      "amazon-q"
      "logi-options+"
      "1password"
      "1password-cli"
    ];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
