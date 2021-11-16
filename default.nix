let 
  pkgs = import <nixpkgs>{}; 
in 
{ stdenv ? pkgs.stdenv,
  coq ? pkgs.coq,
  gnumake ? pkgs.gnumake,
  coqPackages ? pkgs.coqPackages,
  ncurses ? pkgs.ncurses,
  which ? pkgs.which,
  graphviz ? pkgs.graphviz,
}:

stdenv.mkDerivation rec {
  name = "braga-cost";
  version = "0.0.1";
  src = ./.;
  buildInputs = [ coq coqPackages.mathcomp ];
  buildTools = [ gnumake ];
}
