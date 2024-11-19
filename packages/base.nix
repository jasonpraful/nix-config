{ pkgs, config, ... }:
{
  home.packages = with pkgs;
    [
      # Config for VSCode - Synced to Cloud
      vscode
      obsidian
      awscli
      asciinema
      azure-cli
      cloudflared
      coreutils
      gh
      gitleaks
      git
      git-crypt
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
      google-chrome
      postman
      pgadmin4

      
    ];
}

