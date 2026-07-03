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

## Adding ScriptHookV

To add or update the ScriptHookV SDK, just drop the `inc/*.h` header files in `vendor/ScriptHookV/include/ScriptHookV`.
Also put the lib file from `lib/ScriptHookV.lib` into `vendor/ScriptHookV/lib`.

The **include** directory has an extra subfolder for clarity in code header includes and to prevent conflicts/confusion.

## Tips

- I would recommend creating a link to the built **MyProject.asi** file in your GTA directory.
That lets you easily rebuild and `CTRL+R` in-game to reload all ASI modules (so long as the `ScriptHookV.dev` file is in your game folder).
