cmake_minimum_required(VERSION 3.15)

set(CMAKE_CONFIGURATION_TYPES "Debug" "Release")
project(reflecmenu)
add_executable(reflecmenu WIN32 Display.cpp Menu.cpp ReflecMenu.cpp Touch.cpp Display.h Menu.h Touch.h)
add_compile_definitions(_UNICODE CINTERFACE)
set_property(TARGET reflecmenu PROPERTY MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
set_property(TARGET reflecmenu PROPERTY RUNTIME_OUTPUT_DIRECTORY "bin")