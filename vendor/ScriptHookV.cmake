add_library(vendor_ScriptHookV INTERFACE)
target_include_directories(vendor_ScriptHookV INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/vendor/ScriptHookV/include")
target_link_libraries(vendor_ScriptHookV INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/vendor/ScriptHookV/lib/ScriptHookV.lib")

# Only output errors for ScriptHookV compilation. Otherwise, we get a lot.
target_compile_options(vendor_ScriptHookV INTERFACE
        $<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:AppleClang>,$<CXX_COMPILER_ID:GNU>>:-w>
        $<$<CXX_COMPILER_ID:MSVC>:/W0>
)

add_library(ScriptHookV::ScriptHookV ALIAS vendor_ScriptHookV)
