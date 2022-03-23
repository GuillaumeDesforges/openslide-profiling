# Sandbox to play with openslide C API

## Setup

```bash
$ nix develop
$ (nix) mkdir build && cd build
```

## Build

With Nix:

```bash
nix build
```

### Non-Nix

In `build/`

```bash
$ (nix) cmake ..
$ (nix) make
```

Executable is available at `build/out/bin/test-openslide`

## Check memory usage

```bash
$ valgrind --tool=massif --time-unit=B build/out/bin/test-openslide path/to/svs/file
$ ms_print massif.out.12345 | less # file produced by valgrind
```

See https://valgrind.org/docs/manual/ms-manual.html

Valgrind is provided in the Nix development environment.
