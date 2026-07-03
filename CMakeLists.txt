cmake_minimum_required(VERSION 3.5)
project(MyProject LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_SCAN_FOR_MODULES OFF)

include(vendor/ScriptHookV.cmake)

add_library(${CMAKE_PROJECT_NAME} SHARED src/main.cpp)
target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC "$<$<COMPILE_LANG_AND_ID:CXX,MSVC>:/permissive->")
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE ScriptHookV::ScriptHookV)

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES SUFFIX ".asi")
