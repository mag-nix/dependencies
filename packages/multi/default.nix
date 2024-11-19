{ stdenv, b, c, d }:

rec
{
name = "a";
build = stdenv.mkDerivation {
  name = name;
  src = ./src;
  buidlInputs = [b];
  buildPhase = ''
    echo ">>> build a <<<"
    sleep 1
  '';
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
  doCheck = false;
};
test = stdenv.mkDerivation {
  name = "${name}-test";
  src = ./test;
  # Could skip the build phase and use check phase instead
  buildInputs = [build c];
  buildPhase = ''
    echo ">>> test a <<<"
  '';
  installPhase = ''
    mkdir -p $out
    cat test > report
    cp report $out
  '';
  doCheck = false;
};
docs = stdenv.mkDerivation {
  name = "${name}-docs";
  src = ./docs;
  buildInputs = [build test d];
  buildPhase = ''
    echo ">>> build a docs <<<"
  '';
  installPhase = ''
    mkdir -p $out
    echo "# documentation\n" > docs
    cat docu >> docs
    echo "" >> docs
    echo "> build" >> docs
    cat ${build}/hello >> docs
    echo "" >> docs
    echo "> tests" >> docs
    cat ${test}/report >> docs
    echo "" >> docs
    cp docs $out
  '';
  doCheck = false;
};
run = stdenv.mkDerivation {
  name = "${name}-run-dependencies";
  phases = [ "fixupPhase" ];
  propagatedBuildInputs = [ build b c d ];
};
}
