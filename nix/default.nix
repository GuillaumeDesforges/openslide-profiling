{ stdenv
, cmake
, openslide
, pkg-config
, glib
}:

stdenv.mkDerivation {
  pname = "openslide-test";
  version = "0.1";

  src = ./..;

  nativeBuildInputs = [ cmake ];
  
  buildInputs = [
    openslide
    pkg-config
    glib
  ];

  installPhase = ''
    mkdir -p $out/bin
    find out/bin/ -type f -executable -exec cp {} $out/bin \;
  '';
}
