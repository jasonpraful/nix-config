#!/usr/bin/env bash
set -euo pipefail

# hmm vscode managed update

nix flake update
git add flake.lock

git commit -m "nixbld: update flake.lock"
darwin-rebuild switch --flake ~/.config/nix-darwin#mini --impure
git push
git show