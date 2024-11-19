DOTFILES := $(shell pwd)
.PHONY : update mini work build-mini

update:
	set -euo pipefail;
	nix flake update
	git add flake.lock
	git commit -m "Update flake.lock"

update-mini: update
	darwin-rebuild switch --flake ~/.config/nix-darwin#mini --impure
	git push

update-work: update
	darwin-rebuild switch --flake ~/.config/nix-darwin#work --impure
	git push

check-git:
	git diff --exit-code || (echo "git is not clean, aborting"; exit 1)

commit-lock:
	git diff --exit-code -- flake.lock || (echo "flake.lock is not different from the last commit, aborting"; exit 1)
	git add flake.lock
	git commit -m "Update flake.lock"

build-mini: check-git
	darwin-rebuild switch --flake ~/.config/nix-darwin#mini
	$(MAKE) commit-lock

build-work: check-git
	darwin-rebuild switch --flake ~/.config/nix-darwin#work
	$(MAKE) commit-lock
