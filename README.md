# DSP Framework [![Build Status](https://travis-ci.org/ucb-art/dsp-framework.svg?branch=travis)](https://travis-ci.org/ucb-art/dsp-framework)

This project tracks versions of the various dependencies for developing DSP blocks in chisel.

## Quick Version

Running `./update.bash` will check out the correct versions of the various git submodules.
Running `make libs` will build and publish-local them in a local .ivy2 folder.
Running `sbt -Dsbt.ivy.home=path/to/ivy2` in any other scala project will allow you to include the various projects in this repo.
Running `make test` will run the dsptools tests.

This project will not install verilator for you and will not permanently put firrtl on your path- you should do that yourself.
See the [firrtl project README](https://github.com/ucb-bar/firrtl) for details.

## Use

The intended use case is to make this framework a submodule in your scala project.
So do something like the following in your DSP block directory.

```
git submodule add git@github.com:ucb-art/dsp-framework.git
cd dsp-framework
./update.bash
```

To build the framework and have it included in your project, add the following lines to your Makefile in your DSP block directory.

```
framework_dir = $(abspath ./dsp-framework)
base_dir = $(abspath .)
ROCKETCHIP_DIR=$(framework_dir)/rocket-chip
TESTCHIPIP_DIR=$(framework_dir)/testchipip
include $(framework_dir)/Makefrag
FIRRTL_JAR ?= $(ROCKETCHIP_DIR)/firrtl/utils/bin/firrtl.jar
FIRRTL ?= java -Xmx2G -Xss8M -cp $(FIRRTL_JAR) firrtl.Driver
```

This allows you to compile a local copy of the dependencies, and it redefines sbt to point to these versions.
Note, this style is similar to the rocket-chip style of managing dependencies.
At the top level, you can run `make libs` to compile the dependencies.
You'll see lib and .ivy2 directories created, housing unmanaged and managed dependencies respectively.

## What it includes

The framework includes the following subrepos.

### rocket-chip (with firrtl and chisel3)

This gives your project access to rocket-chip's features, such as junctions and the GeneratorApp.
It also uses the versions of chisel3 and firrtl that are compatible with this version of rocket-chip, so if you build your project in a rocket-chip context, you will get version matching by default.
Note that we currently have a forked version of the ucb-bar rocket-chip, allowing us to independently update chisel3 and firrtl.
It also adds Hwacha, our vector accelerator for Rocket.
Hwacha's repository is private currently, so you'll need access to it before building the dependencies.
If your design will not require Hwacha, do the following while building the libraries to exclude it:

```
./update.bash no_hwacha
export ROCKETCHIP_ADDONS=
```

### firrtl-interpreter

This is the firrtl interpreter.

### chisel-testers

Want to test your Chisel design?
Yeah, thought so.
You'll need this.

### testchipip

Included here are useful testing addons to rocket, such as the SCR file and SerialAdapter.
We include this so that individual DSP blocks can have access to a local copy of the SCR file.

### dsptools

Custom types, functions, objects, and junctions useful for DSP projects.

### rocket-dsp-utils

Here live more useful DSP utilities, but these have a dependency on rocket-chip and possibly testchipip, hence being separate from dsptools.
In particular, code and wrappers for CRAFT's DSP blocks and chains are here.

### builtin-debugger

If your design needs a pattern generator or logic analyzer, you'll want this repo included.
