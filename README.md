# DSP Framework [![Build Status](https://travis-ci.org/ucb-art/dsp-framework.svg?branch=travis)](https://travis-ci.org/ucb-art/dsp-framework)

This project tracks versions of the various dependencies for developing DSP blocks in chisel.

Running `./update.bash` will check out the correct versions of the various git submodules.
Running `make` will build and publish-local them in a local .ivy2 folder.
Running `sbt -Dsbt.ivy.home=path/to/ivy2` in any other scala project will allow you to include the various projects in this repo.

This project will not install verilator for you and will not permanently put firrtl on your path- you should do that yourself.
See the [firrtl project README](https://github.com/ucb-bar/firrtl) for details.
