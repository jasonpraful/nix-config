#!/usr/bin/env bash
set -euo pipefail

nix flake update
git add flake.lock

git commit -m "nixbld: update packages"
darwin-rebuild switch --flake ~/.config/nix-darwin#mini --impure

git push
git show