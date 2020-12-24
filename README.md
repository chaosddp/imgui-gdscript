


## How to build

1. Before building, make sure the sub-modules are ready.

git submodule update --init --recursive

2. Build godot-cpp:

scons platform=<platform> generate_bindings=yes bits=64 target=release -j<cpu core>

3. Build imgui-gdscript

scons platform=<platform> target=release


## How to use

The libary will output into dist folder, copy all dist/bin to your project root.


NOTE:

Only tested on Windows.