# Nix Config

Custom Nix configuration files for Darwin systems.

## Installation

Install Nix

```bash
sh <(curl -L https://nixos.org/nix/install)
```

Install Nix Darwin

```bash
nix --extra-experimental-features "nix-command flakes" run nix-darwin/master#darwin-rebuild -- switch nix --extra-experimental-features "nix-command flakes" run nix-darwin/master#darwin-rebuild -- switch --flake .#<workstation-name>
```

> Reboot your system after this stage

Configuring easy nix build via `nixbld` alias via `~/.zshrc` or `~/.bashrc`

```bash
alias nixbld="darwin-rebuild switch --flake ~/.config/nix-darwin#mini"
```
