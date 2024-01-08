include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <BOSL2/rounding.scad>

include <extender_params.scad>

// Uncomment the following line to see a cut along the axis
//projection(cut=true) rotate([90,0,0])

h1 = 7;
h2 = h1 + 3;
h3 = h2 + 5;

d1 = 25;
d2 = 27.5;

rotate([180, 0, 0])
{
  difference() {

    union() {
      // M30 male thread
      translate([0, 0, L - l2])
        threaded_rod(d=d, l=l2, pitch=pitch, anchor=[0, 0, -1], $slop=slop, $fa = 1, $fs = 0.5);

      md = 28.376; // M30 minor diameter

      shape = [
        [d1/2, L - l2 - (md - d1)/2],
        [d1/2, 3],
        [d2/2, 3],
        [d1/2, 0],
        [16/2, 0],
        [16/2, h2],
        [0, h2],
        [0, L - l2],
        [md/2, L - l2],
      ];

      // Round the exterior
      // https://github.com/revarbat/BOSL2/wiki/rounding.scad#function-round_corners
      radii = [
         5,
         0, 0, 0, 0, 0, 0, 0, 0,
      ];
      shape2 = round_corners(shape, radius = radii, $fa=1, $fs=0.5);

      rotate_extrude($fn = fn)
        polygon(shape2);
    }

    // hexagon
    cylinder(h=7, d=21.8, $fn=6);

    // cuts
    size = [3.4,L,h2*2];
    cube(size, center=true);
    rotate([0, 0, 120])
    cube(size, center=true);
    rotate([0, 0, -120])
    cube(size, center=true);

    // Subtract the pin hole
    cylinder(h = 3*L, d=ped, center=true, $fn = pfn);
  }
}
