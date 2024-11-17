{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Jason Praful";
    userEmail = "jason.praful@gmail.com";

    delta.enable = true;

    ignores = [
      "**/.idea/"
      "**/.vscode/settings.json"
      "**/.DS_Store"
    ];

    extraConfig = {
      "sendpack" = {
        sideband = false;
      };
      "push" = {
        autoSetupRemote = true;
      };
      "init" = {
        defaultBranch = "main";
      };
      "filter" = {
        "lfs" = {
          clean = "git-lfs clean -- %f";
          smudge = "git-lfs smudge -- %f";
          process = "git-lfs filter-process";
          required = true;
        };
      };
      "credential" = {
        "helper" = "/usr/local/share/gcm-core/git-credential-manager";
        "https://dev.azure.com" = {
          useHttpPath = true;
        };
      };
    };
  };

}
