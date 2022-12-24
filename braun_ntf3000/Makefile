all: cap.stl

package: braun_ntf3000_cap.7z

braun_ntf3000_cap.7z: \
	cap.scad \
	cap.stl \
	Makefile
	-$(RM) $@
	7za a $@ $^

%.stl: %.scad
	openscad -o $@ $<
