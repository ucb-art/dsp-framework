#!/bin/bash
DIR=`dirname $0`
cd $DIR/firrtl ; sbt publish-local ; sbt assembly; cd ..
cd $DIR/firrtl-interpreter ; sbt publish-local ; cd ..
cd $DIR/chisel3 ; sbt publish-local ; cd ..
cd $DIR/chisel-testers ; sbt publish-local ; cd ..
cd $DIR/dsptools ; sbt publish-local ; sbt test ; cd ..
