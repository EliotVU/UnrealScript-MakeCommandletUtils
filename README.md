# MakeCommandletUtils

This is a simple commandlet to add and remove a specified editpackage for the use in Batch files when you are not using an IDE.

Originally published at https://wiki.beyondunreal.com/User:Eliot/EditPackagesCommandlet

## Building

1. Extract this repository in your game's root for example `C:\YourGameRoot\MakeCommmandletUtils`
2. Run the make.bat file `C:\YourGameRoot\MakeCommandletUtils\make.bat`

## Usage

Ensure you have the compiled form of MakeCommandletUtils before runnning the batch file, e.g. `C:\YourGameRoot\System\MakeCommandletUtils.u`
In a batch file i.e. `make.bat`, for example `C:\YourGameRoot\YourProjectName\make.bat`

```bat
@echo off

for %%* in (.) do set project_name=%%~n*

title %project_name%
color 0F

echo.
echo Deleting compiled files %project_name%
echo.
cd..
cd system
del %project_name%.u
del %project_name%.ucl

ucc.exe MakeCommandletUtils.EditPackagesCommandlet 1 %project_name%
ucc.exe editor.MakeCommandlet
ucc.exe MakeCommandletUtils.EditPackagesCommandlet 0 %project_name%
pause
```

Run the make.bat to automate the compilation and deletion of your project's .u file.

## Derivative works

- Killing Floor https://github.com/InsultingPros/KFCmdlet
