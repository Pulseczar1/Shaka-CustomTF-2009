# Shaka's CustomTF 2009
This is a branch of Shaka's latest version of CustomTF, for Quake Team Fortress, made in early 2009. The purpose of this branch is to get the mod to run on a modern server executable -- in this case, MVDSV. A modified version of MVDSV was used (PQWSV), created by Often, in order to speed up integration.

Shaka's repository: https://github.com/ShakaUVM/CustomTF <br />
Often's repository: https://gitlab.com/prozac-customtf <br />
MVDSV repository:   https://github.com/QW-Group/mvdsv <br />

## Setting Up

### Scripts

Copy the scripts and configuration files in `Scripts` into your Quake directory. The directory structure should be preserved. After you put those files where they go, edit them to your needs and preferences.

### Progs/QuakeC Compiler

You will need to be able to compile the progs/mod QuakeC code. In general, any QuakeC compiler should be able to do this. It will also require a QuakeC preprocessor/precompiler, ran on the code, before the compiler. There are probably several QuakeC preprocessors out there that would work. I would recommend using the QuakeC preprocessor and compiler made for CustomTF. You can get a version of both of those over at Often's repository: <br />
https://gitlab.com/prozac-customtf/quakec-preprocessor <br />
https://gitlab.com/prozac-customtf/quakec-compiler <br />
Both should work on Linux and Windows. I'm not going to provide instructions, here, for building software I don't maintain, because the software could change at any time, but there are plenty of people that can help you compile programs. At the time of this writing, running `make`, in the same directory as the source code, was sufficient, for compiling on my Linux machine. Once you get the two programs compiled, place them in the `Progs` directory. Name the preprocessor `cppreqcc` and the compiler `cpqccx`. If you are in Windows, you'll need to put `.exe` on the end of the file names.

## Compiling In Linux

### Compiling the Progs QuakeC Code

Set `PATH_TO_FORTRESS_DIRECTORY` in `Progs/make.sh`. <br />
Run `make.sh`, in `Progs`, to compile the CustomTF progs/mod code.

### Compiling the Server Engine, PQWSV (MVDSV)

Set `PATH_TO_QUAKE_DIRECTORY` in `PQWSV/build/make/compile` and change the parallel job count (`-j#`) to the number of processing cores available on your machine (double it if you have hyperthreading), plus 1. <br />
Run `compile`, in `PQWSV/build/make`, to compile the PQWSV executable.

## Running In Linux

In your Quake directory, execute: `./runShakaCuTF.sh public` <br />
Replace `public` with `test` for a private server.
