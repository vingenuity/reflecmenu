# ReflecMenu

A launcher menu for Reflec Beat that uses the touch panel to select games.

Includes a CMake makefile that generates Visual Studio solutions. These solutions compile to a static executable which runs on XPE, suitable for use on a Reflec Beat cabinet.


## Building Menu

1. Double-click 'build_with_vs.bat'.
2. Specify the year of Visual Studio (2008-2019) for which you would like to generate a solution.
3. Compiled executable can be found in 'build/bin/Release' directory.

Alternatively, 'build_with_vs.bat' can also be called from the command line, specifying the Visual Studio year and (optionally) build configuration.


## Ini Format

The ini file format is simple. For each game, there should be a section which is the game name. For each section, there should be a "launch" key which points to the full path of the executable or batch file to execute when selecting this option. An example is below:

```
[Colette]
launch=D:\MBR-colette\contents\gamestart.bat

[Groovin'!!]
launch=D:\MBR-groovin\contents\gamestart.bat

[Volzza]
launch=D:\MBR-volzza\contents\gamestart.bat
```


## Running Menu

To correctly execute the built code, run the executable with one parameter specifying the location of the INI file. An example invocation is as follows:

```
ReflecMenu.exe games.ini
```