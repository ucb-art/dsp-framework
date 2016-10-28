# DSP Framework

This project tracks versions of the various dependencies for developing DSP blocks in chisel.

Running `./update.bash` will check out the correct versions of the various git submodules and `sbt publish-local` them.
At the end, it will also run `sbt test` in the dsptools project, which should pass (except for `examples.TransposedStreamFIRSpec` currently).

This project will not install verilator for you and will not permanently put firrtl on your path- you should do that yourself.
See the [firrtl project README](https://github.com/ucb-bar/firrtl) for details.
