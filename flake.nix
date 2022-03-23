{
  nixConfig.bash-prompt-suffix = "(nix) ";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.flake-compat = {
    url = github:edolstra/flake-compat;
    flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    let
      overlay = import ./nix/overlay.nix;
    in
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ overlay ];
          };
        in
        {
          defaultPackage = pkgs.openslide-test;
          devShell = pkgs.callPackage ./nix/devShell.nix { pkg = pkgs.openslide-test; };

          passthru = { inherit pkgs; };
        }
      )
    // {
      inherit overlay;
    };
}
