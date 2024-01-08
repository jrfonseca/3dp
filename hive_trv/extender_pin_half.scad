include <extender_params.scad>

color("red")
intersection() {
  rotate(90, [0, 1, 0]) cylinder(h = L, d=pid, center=false, $fn = pfn);
  translate([0, 0, 1]*L) cube(2*L, center=true);
}
