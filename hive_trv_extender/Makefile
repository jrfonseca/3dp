all: \
	extender_column.stl \
	extender_flange.stl \
	extender_pin_half.stl

extender_column.stl: extender_column.scad extender_common.scad
extender_flange.stl: extender_flange.scad extender_common.scad
extender_pin_half.stl: extender_pin_half.scad extender_common.scad

package: hive_trv_extender.7z

hive_trv_extender.7z: \
	extender_common.scad extender_column.scad extender_flange.scad extender_pin_half.scad \
	extender_column.stl extender_pin_half.stl \
	extender_column.stl extender_flange.stl extender_pin_half.stl \
	Makefile
	-$(RM) $@
	7za a $@ $^

%.stl: %.scad
	openscad -o $@ $<
