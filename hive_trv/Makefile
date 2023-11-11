all: \
	extender_body.stl \
	extender_pin_half.stl

extender_body.stl: extender_body.scad extender_params.scad
extender_pin_half.stl: extender_pin_half.scad extender_params.scad

package: hive_trv_extender.7z

hive_trv_extender.7z: \
	extender_params.scad extender_body.scad extender_pin_half.scad \
	extender_body.stl extender_pin_half.stl \
	Makefile
	-$(RM) $@
	7za a $@ $^

%.stl: %.scad
	openscad -o $@ $<
