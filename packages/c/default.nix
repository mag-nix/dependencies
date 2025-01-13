{ stdenv, d, runtimePackages }:

stdenv.mkDerivation {
  name = "c";
  src = ./src;
  propagetedBuildInputs = runtimePackages d;
  buildPhase = ''
    echo ">>> build c <<<"
    echo "changed runtime dependencies!!"
    sleep 1
  '';
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
}
