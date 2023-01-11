# Shaka-CustomTF-2009
This is a branch of Shaka's latest version of CustomTF, for Quake Team Fortress, made in January 2009. The purpose of this branch is to get the mod to run on a modern server executable -- in this case, MVDSV. A modified version of MVDSV was used, created by Often, in order to speed up integration.

Shaka's repository: https://github.com/ShakaUVM/CustomTF
Often's repository: https://gitlab.com/prozac-customtf
MVDSV repository:   https://github.com/QW-Group/mvdsv

# Setting Up

Copy the scripts and configuration files in Scripts into your Quake directory. The directory structure should be preserved.
After you put those files where they go, edit them to your needs and preferences.

# Compiling In Linux

Set `PATH_TO_FORTRESS_DIRECTORY` in Progs/make.sh.
Run make.sh, in Progs, to compile the CustomTF progs/mod code.

Set `PATH_TO_QUAKE_DIRECTORY` in PQWSV/build/make/compile and change the parallel job count (-j#) to the number of processing cores (double if you have hyperthreading) available on your machine, plus 1.
Run compile, in PQWSV/build/make, to compile the PQWSV executable.

# Running In Linux

In your Quake directory, execute: ./runShakaCuTF.sh public
Replace `public` with `test` for a private server.

