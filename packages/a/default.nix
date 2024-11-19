{ stdenv, b, c, d }:

stdenv.mkDerivation {
  name = "a";
  src = ./src;
  buidlInputs = [b];
  checkInputs = [c];
  buildPhase = ''
    echo ">>> build a <<<"
    sleep 1
  '';
  checkPhase = ''
    echo ">>> test a <<<"
  '';
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
  doCheck = true;
}