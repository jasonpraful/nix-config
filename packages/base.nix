{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
      # Config for VSCode - Synced to Cloud
      vscode
      obsidian
      awscli
      asciinema
      azure-cli
      cloudflared
      gh
      gitleaks
      git
      git-crypt
      go
      iterm2
      jq
      k9s
      imagemagick
      minikube
      mkcert
      mkdocs
      mongosh
      vim
      nixpkgs-fmt
      pixman
      pkg-config

      nodejs
      openjdk
      openjpeg
      openssl
      redis
      ripgrep

      terraform
      kubectl
      kubernetes-helm
      k9s

      pyenv
      python39
      python310
      python311
      python312
      python313

      sshpass
      stripe-cli
      tesseract
      tmux
      tree
      watchman
      wget

      yq
      git-credential-manager
      keycastr
      rectangle
      home-manager
      nil

    ];
}

