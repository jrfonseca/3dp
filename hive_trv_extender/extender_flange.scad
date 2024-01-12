include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <BOSL2/rounding.scad>

include <extender_common.scad>


intersection() {
  extender_column();
  cube([2*L, 2*L, 2*h1], center=true);
}
