old gens:  sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
old hm: home-manager expire-generations "-0 days"

gc: sudo nix-collect-garbage -d
optimize store: sudo nix-store --optimise

update flake: nix flake update

lint: statix check .
