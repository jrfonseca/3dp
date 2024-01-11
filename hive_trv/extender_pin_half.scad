include <extender_common.scad>

color("red")
intersection() {
  rotate([0, 90, 0]) extender_pin();
  translate([0, 0, 1]*L) cube(2*L, center=true);
}
