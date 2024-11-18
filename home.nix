{ pkgs, lib, system, ... }:
{
  programs = {
    jq.enable = true;
  };
  home = {
    sessionVariables = {
      EDITOR = "vim";
    };
    stateVersion = "24.11";
  };

  imports = [
    ./fonts
    ./packages/base.nix
    ./packages/git.nix
  ];

}
