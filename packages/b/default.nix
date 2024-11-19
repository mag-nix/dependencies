{ stdenv }:

stdenv.mkDerivation {
  name = "b";
  src = ./src;
  buildPhase = ''
    echo ">>> build b <<<"
    sleep 1
  '';
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
}