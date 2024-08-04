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
        };
    in
    {
      "18.1.8" = llvmBuilder { version = "18.1.8"; sha256 = ""; };
    };
}
