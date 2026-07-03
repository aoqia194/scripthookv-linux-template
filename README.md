### A minimal template for C++ ScriptHookV ASI modules to compile and run on Linux

ScriptHookV's `ScriptHookV.lib` static library is compiled with MSVC.
This makes it a little tricky to set up a project to link against, but it's possible!
That's why I've made this template.

## Requirements

All-platform requirements:

- Clang
- Ninja
- CMake

Linux-specific requirements:

- [msvc-wine](https://github.com/mstorsjo/msvc-wine)

## Building

To build the barebones **asi**, I would recommend opening it in your IDE and use the CMake presets.
Alternatively, you can build it like so from the command line:

```shell
cmake --preset release-linux && cmake --build --preset release-linux
```

Building on Windows should be exactly the same, using the non-Linux CMake presets instead.

## Tips

- I would recommend creating a link to the built **MyProject.asi** file in your GTA directory.
That lets you easily rebuild and `CTRL+R` in-game to reload all ASI modules (so long as the `ScriptHookV.dev` file is in your game folder).
