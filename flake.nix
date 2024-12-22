{
description = ''A flake that creates a devShell containing the following:
			- Nixvim (based on nixos-unstable)
            - Just (project maintenance/cleanup scripts)
		'';

inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim.url = "github:Pleb5/neovim-flake/master";
};

outputs = { nixpkgs, flake-utils, nixvim, ... }:

    flake-utils.lib.eachDefaultSystem (system:
        let
            pkgs = nixpkgs.legacyPackages.${system};
            nvim = nixvim.packages.${system}.nvim;
        in {
            devShell = pkgs.mkShell {
                buildInputs = [ 
                    nvim
                    pkgs.ripgrep
                    pkgs.just
                ];
                shellHook = ''
                '';
            };
        }
    );    
}