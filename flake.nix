{
  description = "A very basic dependency testing flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };
    callPackage = pkgs.newScope self.packages.x86_64-linux;
  in
  {
    packages.x86_64-linux.a = callPackage ./packages/a { };
    packages.x86_64-linux.b = callPackage ./packages/b { };
    packages.x86_64-linux.c = callPackage ./packages/c { };
    packages.x86_64-linux.d = callPackage ./packages/d { };
    packages.x86_64-linux.e = callPackage ./packages/e { };
    packages.x86_64-linux.multi = callPackage ./packages/multi { };
    packages.x86_64-linux.passthru = callPackage ./packages/passthru { };

    function.runtimePackages = { package }:
      let
        recurse = package:
          if pkgs.lib.attrsets.hasAttrByPath [ "passthru" "dependencies" ] package
            then pkgs.lib.lists.flatten ( [ package ] ++ map (p: recurse p) package.passthru.dependencies )
            else [ package ];
      in
      recurse package
    ;
  };
}
