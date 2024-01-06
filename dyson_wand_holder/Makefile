all: dyson_wand_holder.stl

package: dyson_wand_holder.7z

dyson_wand_holder.7z: \
	dyson_wand_holder.stl \
	dyson_wand_holder.scad \
	Makefile
	-$(RM) $@
	7za a $@ $^

%.stl: %.scad
	openscad -o $@ $<
