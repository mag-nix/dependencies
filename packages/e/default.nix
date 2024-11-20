{ stdenv, multi }:

stdenv.mkDerivation {
  name = "a";
  src = ./src;
  buidlInputs = [multi.run];
  checkInputs = [];
  buildPhase = ''
    echo ">>> build ea <<<"
    cp ${multi.build}/hello hello
    sleep 1
  '';
  checkPhase = ''
    echo ">>> test ea <<<"
  '';
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
  doCheck = true;
}
