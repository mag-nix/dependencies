{ stdenv }:

stdenv.mkDerivation {
  name = "c";
  src = ./src;
  buildPhase = ''
    echo ">>> build c <<<"
    sleep 1
  '';
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
}