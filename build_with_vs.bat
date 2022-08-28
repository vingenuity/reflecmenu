@echo off

:: --------------------------------------------------------------
:: STATIC ENVIRONMENT VARIABLES
:: --------------------------------------------------------------
set CMAKE_PATH=cmake

set BUILD_DIR=.\build
set DEFAULT_BUILD_CONFIG=Release
set SOURCE_DIR=.\ReflecMenu


:: --------------------------------------------------------------
:: DYNAMIC ENVIRONMENT VARIABLES
:: --------------------------------------------------------------
if [%1]==[] (
    set /P VS_YEAR=Please enter the year of Visual Studio [2008-2019] for which to generate a solution:
) else (
    set VS_YEAR=%1
)

if [%2]==[] (
    set BUILD_CONFIG=%DEFAULT_BUILD_CONFIG%
) else (
    set BUILD_CONFIG=%2
)


:: --------------------------------------------------------------
:: MAIN EXECUTION
:: --------------------------------------------------------------
:select_vs
if "%VS_YEAR%"=="2019" (
    set CMAKE_GENERATOR=Visual Studio 16 2019
    set VS_TOOLSET=v141_xp
    goto :generate
)
if "%VS_YEAR%"=="2017" (
    set CMAKE_GENERATOR=Visual Studio 15 2017
    set VS_TOOLSET=v141_xp
    goto :generate
)
if "%VS_YEAR%"=="2015" (
    set CMAKE_GENERATOR=Visual Studio 14 2015
    set VS_TOOLSET=v140_xp
    goto :generate
)
if "%VS_YEAR%"=="2013" (
    set CMAKE_GENERATOR=Visual Studio 12 2013
    set VS_TOOLSET=v120_xp
    goto :generate
)
if "%VS_YEAR%"=="2012" (
    set CMAKE_GENERATOR=Visual Studio 11 2012
    set VS_TOOLSET=v110_xp
    goto :generate
)
if "%VS_YEAR%"=="2010" (
    set CMAKE_GENERATOR=Visual Studio 10 2010
    set VS_TOOLSET=v100_xp
    goto :generate
)
if "%VS_YEAR%"=="2008" (
    set CMAKE_GENERATOR=Visual Studio 9 2008
    set VS_TOOLSET=
    goto :generate
)
goto :error__vs_year

:generate
echo Generating solution file for '%CMAKE_GENERATOR%'...
if defined VS_TOOLSET set VS_TOOLSET_ARG=-T %VS_TOOLSET%
"%CMAKE_PATH%" -G "%CMAKE_GENERATOR%" -A Win32 %VS_TOOLSET_ARG% -S %SOURCE_DIR% -B %BUILD_DIR%
if ERRORLEVEL 1 goto :error__generate
goto :build

:build
echo Building reflecmenu in '%BUILD_CONFIG%' configuration...
"%CMAKE_PATH%" --build %BUILD_DIR% --config %BUILD_CONFIG%
if ERRORLEVEL 1 goto :error__build
goto :finish


:error__vs_year
echo ERROR: Invalid Visual Studio year '%VS_YEAR%' was specified!
goto :finish

:error__generate
echo ERROR: An error has occurred while generating solution files for reflecmenu!
goto :finish

:error__build
echo ERROR: An error has occurred while building reflecmenu!
goto :finish


:finish
pause
