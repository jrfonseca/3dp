all: \
	trv_extender_column.stl \
	trv_extender_flange.stl \
	trv_extender_pin_half.stl

trv_extender_%.stl: trv_extender.scad
	openscad -o $@ -D "part=\"$*\"" $<

package: hive_trv_trv_extender.7z

hive_trv_trv_extender.7z: \
	trv_extender.scad \
	trv_extender_column.stl trv_extender_pin_half.stl \
	trv_extender_column.stl trv_extender_flange.stl trv_extender_pin_half.stl \
	Makefile
	-$(RM) $@
	7za a $@ $^
