include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <BOSL2/rounding.scad>

include <extender_common.scad>


rotate([180, 0, 0])
intersection() {
  extender_column();
  translate([0, 0, L + h1]) cube([2*L, 2*L, 2*L], center=true);
}
