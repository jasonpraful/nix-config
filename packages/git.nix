{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Jason Praful";
    userEmail = "jason.praful@gmail.com";

    delta.enable = true;

    ignores = [
      "**/.vscode/settings.json"
      "**/.DS_Store"
    ];

    includes = [
      {
        path = "~/Desktop/Code/Work/.gitconfig";
        condition = "gitdir:~/Desktop/Code/Work/";
      }
      {
        path = "~/Desktop/Code/Work/github/";
        condition = "gitdir:~/Desktop/Code/Work/github/.gitconfig";
      }
      {
        path = "~/Desktop/Code/Playground/";
        condition = "gitdir:~/Desktop/Code/Playground/.gitconfig";
      }
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
        helper = "manager";
        credentialStore = "keychain";
        "https://dev.azure.com" = {
          useHttpPath = true;
        };
        "https://github.com" = {
          useHttpPath = true;
        };
        "https://git.jasonpraful.co.uk" = {
          useHttpPath = true;
        };
        "https://gitlab.com" = {
          useHttpPath = true;
        };
      };
    };
  };

}
