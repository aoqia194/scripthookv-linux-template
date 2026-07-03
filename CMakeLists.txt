cmake_minimum_required(VERSION 3.5)
project(MyProject LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_SCAN_FOR_MODULES OFF)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(VENDOR_INCLUDE_DIR "${CMAKE_BINARY_DIR}/vendor/include")
set(VENDOR_LIB_DIR "${CMAKE_BINARY_DIR}/vendor/lib")

include(ScriptHookV)

add_library(${CMAKE_PROJECT_NAME} SHARED src/main.cpp)
target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE ${VENDOR_INCLUDE_DIR})
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE ScriptHookV::ScriptHookV)
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC "$<$<COMPILE_LANG_AND_ID:CXX,MSVC>:/permissive->")

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES SUFFIX ".asi")
