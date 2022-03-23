{ pkg
, valgrind
}:

pkg.overrideAttrs (old:
  {
    buildInputs = (old.buildInputs or []) ++ [
      valgrind
    ];
  }
)
