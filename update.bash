#!/bin/bash
git submodule update --init
if [ "$1" == "no_hwacha" ]; then
  cd rocket-chip; cat .gitmodules | grep path | awk '{print $3}' | grep -v hwacha | grep -v riscv-tools | xargs git submodule update --init; rm src/main/scala/rocketchip/PrivateConfigs.scala; cd ..
else
  cd rocket-chip; git submodule update --init; cd ..
fi

