{ pkgs, lib, system, ... }:
{
  programs = {
    jq.enable = true;
  };
  home = {
    sessionVariables = {
      EDITOR = "vim";
    };
  };

  imports = [
    "./fonts"
    "./programs/base.nix"
    "./programs/git.nix"
  ];

  stateVersion = 5;
}
