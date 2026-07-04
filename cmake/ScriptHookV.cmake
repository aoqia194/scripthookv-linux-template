include_guard(GLOBAL)
include(FetchContent)

FetchContent_Declare(
        ScriptHookV
        URL https://www.dev-c.com/files/ScriptHookV_SDK_1.0.617.1a.zip
        URL_HASH SHA256=56b6ad265b2b93aa4e73f79f97949d72f3683a35576b977e63dde91c6485fe22
        HTTP_HEADER "Referer: https://www.dev-c.com/gtav/scripthookv/"
        DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
FetchContent_MakeAvailable(ScriptHookV)

set(ScriptHookV_SOURCE_DIR "${scripthookv_SOURCE_DIR}")
set(ScriptHookV_HEADER_DEST "${VENDOR_INCLUDE_DIR}/ScriptHookV")
set(ScriptHookV_LIB_DEST "${VENDOR_LIB_DIR}/ScriptHookV")

file(MAKE_DIRECTORY ${ScriptHookV_HEADER_DEST})
file(MAKE_DIRECTORY ${ScriptHookV_LIB_DEST})

file(COPY "${ScriptHookV_SOURCE_DIR}/inc/" DESTINATION "${ScriptHookV_HEADER_DEST}")
file(COPY "${ScriptHookV_SOURCE_DIR}/lib/" DESTINATION "${ScriptHookV_LIB_DEST}")

add_library(vendor_ScriptHookV INTERFACE)
target_link_libraries(vendor_ScriptHookV INTERFACE "${ScriptHookV_LIB_DEST}/ScriptHookV.lib")

# Only output errors for ScriptHookV compilation. Otherwise, we get a lot.
target_compile_options(vendor_ScriptHookV INTERFACE
        $<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:AppleClang>,$<CXX_COMPILER_ID:GNU>>:-w>
        $<$<CXX_COMPILER_ID:MSVC>:/W0>
)

add_library(ScriptHookV::ScriptHookV ALIAS vendor_ScriptHookV)
