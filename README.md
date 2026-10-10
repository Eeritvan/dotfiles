old gens: sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system

gc: sudo nix-collect-garbage -d 

optimize store: sudo nix-store --optimise

update flake: nix flake update

lint: statix check .
