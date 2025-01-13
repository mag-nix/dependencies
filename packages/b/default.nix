{ stdenv, c }:

stdenv.mkDerivation {
  name = "b";
  src = ./src;
  propagatedBuildInputs = [ c ];
  buildPhase = ''
    echo ">>> build b <<<"
    sleep 1
  '';
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
}
