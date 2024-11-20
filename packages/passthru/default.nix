{ stdenv, b, c, d }:
stdenv.mkDerivation {
  name = "a";
  src = ./src;
  buidlInputs = [b];
  checkInputs = [];
  buildPhase = ''
    echo ">>> build a <<<"
    sleep 1
  '';
  checkPhase = ''
    echo ">>> quick tests a <<<"
  '';
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
  doCheck = true;
  passthru = {
    tests = stdenv.mkDerivation {
      name = "${name}-test";
      src = ./test;
      # Could skip the build phase and use check phase instead
      buildInputs = [finalAttrs.finalPackage c];
      buildPhase = ''
        echo ">>> long tests a <<<"
      '';
      installPhase = ''
        mkdir -p $out
        cat test > report
        cp report $out
      '';
      doCheck = false;
    };

    dependencies = [
      c
      d
    ];
    docs = stdenv.mkDerivation {
      name = "${name}-docs";
      src = ./docs;
      buildInputs = [finalAttrs.finalPackage finalAttrs.passthru.tests d];
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
}