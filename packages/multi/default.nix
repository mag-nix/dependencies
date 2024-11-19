{ stdenv, b, c, d }:

rec
{
build = stdenv.mkDerivation {
  name = "a";
  src = ./src;
  buidlInputs = [b];
  checkInputs = [c];
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
  name = "a-test";
  src = ./test;
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
  name = "a-docs";
  src = ./docs;
  checkInputs = [build test d];
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
}
