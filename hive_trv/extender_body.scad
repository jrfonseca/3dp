include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <BOSL2/rounding.scad>

include <extender_params.scad>

// Uncomment the following line to see a cut along the axis
//projection(cut=true) rotate([90,0,0])

rotate([180, 0, 0])
{
  difference() {

    union() {
      // M30 female thread, to screw onto the thermostatic radiator valve
      intersection() {
        cylinder(h=2*l1, r=od/2, center=true, $fn = fn);
        threaded_nut(shape="square", nutwidth=2*od, id=d, h=l1, pitch=pitch, anchor=[0, 0, 1], $slop=slop, $fa = 1, $fs = 0.5);
      }

      // M30 male thread
      translate([0, 0, L - l2])
        threaded_rod(d=d, l=l2, pitch=pitch, anchor=[0, 0, -1], $slop=slop, $fa = 1, $fs = 0.5);

      md = 28.376; // M30 minor diameter

      h1 = 7;
      h2 = h1 + 3;
      h3 = h2 + 5;

      shape = [
        [md/2, h2 + (od - md)/2],
        [od/2, h2],
        [od/2, 0],
        [22/2, 0],
        [22/2, h1],
        [16/2, h1],
        [16/2, h2],
        [0, h2],
        [0, L - l2],
        [md/2, L - l2],
      ];

      // Round the exterior
      // https://github.com/revarbat/BOSL2/wiki/rounding.scad#function-round_corners
      radii = [
         5, 5,
         0, 0, 0, 0, 0, 0, 0, 0,
      ];
      shape2 = round_corners(shape, radius = radii, $fa=1, $fs=0.5);

      rotate_extrude($fn = fn)
        polygon(shape2);
    }

    // Subtract the pin hole
    cylinder(h = 3*L, r=ped/2, center=true, $fn = pfn);
  }
}
