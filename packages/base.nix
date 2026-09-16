{ pkgs, config, lib, ... }:
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
      (lib.hiPrio kubectl)
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
      home-manager
      nil
      pgadmin4


    ];
}

