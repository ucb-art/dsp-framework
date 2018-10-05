base_dir = $(abspath ..)
framework_dir = $(abspath .)

include Makefrag

clean:
	rm -rf $(lib_dir) $(ivy_dir)/local
