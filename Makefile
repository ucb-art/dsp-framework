framework_dir = $(abspath .)
base_dir = $(abspath .)

include Makefrag

clean:
	rm -rf $(lib_dir) $(ivy_dir)/local
