#!/bin/bash
git submodule update --init
cd rocket-chip; git submodule update --init; cd ..

source ./setenv.sh
