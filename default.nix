self: super: {
  llvm =
    let
      lib = super.lib;
      stdenv = super.stdenv;
      fetchurl = super.fetchurl;
      fetchFromGitHub = super.fetchFromGitHub;

      llvmBuilder = { pname ? "llvm", version, sha256 }:
        stdenv.mkDerivation rec {
          inherit pname version;

          src = fetchFromGitHub {
            inherit sha256;
            owner = pname;
            repo = "${pname}-project";
            rev = "llvmorg-${version}";
          };

          nativeBuildInputs = with super; [
            cmake
            ninja
            python3
            git
          ];

          buildPhase = ''
            ninja -C build
          '';

          installPhase = ''
          '';

          configurePhase = ''
            cmake -S llvm -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug
          '';
        };
    in
    {
      "18.1.8" = llvmBuilder { version = "18.1.8"; sha256 = "1l9wm0g9jrpdf309kxjx7xrzf13h81kz8bbp0md14nrz38qll9la"; };
    };
}
