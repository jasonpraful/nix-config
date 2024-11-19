{ pkgs, config, lib, system, ... }:
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

  home.activation = {
    rsync-home-manager-applications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      rsyncArgs="--archive --checksum --chmod=-w --copy-unsafe-links --delete"
      apps_source="$genProfilePath/home-path/Applications"
      moniker="Home Manager Trampolines"
      app_target_base="${config.home.homeDirectory}/Applications"
      app_target="$app_target_base/$moniker"
      mkdir -p "$app_target"
      ${pkgs.rsync}/bin/rsync $rsyncArgs "$apps_source/" "$app_target"
    '';
  };
  imports = [
    ./fonts
    ./packages/base.nix
    ./packages/git.nix
  ];

}
