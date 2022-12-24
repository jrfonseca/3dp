all: \
	extender_body.stl \
	extender_pin.stl

extender_body.stl: extender_body.scad extender_params.scad
extender_pin.stl: extender_pin.scad extender_params.scad

package: hive_trv_extender.7z

hive_trv_extender.7z: \
	extender_params.scad extender_body.scad extender_pin.scad \
	extender_body.stl extender_pin.stl \
	Makefile
	-$(RM) $@
	7za a $@ $^

%.stl: %.scad
	openscad -o $@ $<
