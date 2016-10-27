#!/bin/bash
git submodule update --init --recursive
export PATH=$PWD/firrtl/utils/bin:$PATH
DIR=`pwd -P`
cd $DIR/firrtl ; sbt publish-local ; sbt assembly; cd ..
cd $DIR/firrtl-interpreter ; sbt publish-local ; cd ..
cd $DIR/chisel3 ; sbt publish-local ; cd ..
cd $DIR/chisel-testers ; sbt publish-local ; cd ..
cd $DIR/dsptools ; sbt publish-local ; sbt test ; cd ..
cd $DIR/context-dependent-environments ; sbt publish-local ; sbt test ; cd ..
