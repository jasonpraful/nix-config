{ pkgs, config, ... }:
{
  home.packages = with pkgs;
    [
      obsidian
      awscli2
      asciinema
      azure-cli
      cloudflared
      coreutils
      gh
      gitleaks
      git
      go
      iterm2
      jq
      k9s
      imagemagick
      mkcert
      mkdocs
      mongosh
      neovim
      nixpkgs-fmt
      pixman
      pkg-config

      nodejs
      volta
      openjdk
      openjpeg
      openssl
      redis
      ripgrep

      terraform
      kubectl
      kubectx
      kind
      minikube
      kubernetes-helm
      k9s

      pyenv
      python312

      sshpass
      stripe-cli
      tesseract
      tmux
      tree
      watchman
      wget
      nmap

      yq
      git-credential-manager
      git-crypt
      keycastr
      rectangle
      home-manager
      nil
      pgadmin4


    ];
}

