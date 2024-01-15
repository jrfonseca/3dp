// FIXME: Needs to be calibrated as explained in
// https://github.com/revarbat/BOSL2/wiki/constants.scad#constant-slop
slop = 0.10;

L = 135;

// Pin
pid = 6; // internal diameter
ped = pid + 5*slop;  // external diameter
pfn = $preview ? 32 : 64;  // $fn

d = 30;
l2 = 6;
pitch = 1.5;

// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Other_Language_Features#$fa,_$fs_and_$fn

fn = $preview ? 64 : 128;


h1 = 7;
h2 = h1 + 3;

md = 28.376; // M30 minor diameter

d1 = 25;
d2 = md;


module extender_column() {
  // Uncomment the following line to see a cut along the axis
  //projection(cut=true) rotate([90,0,0])

  difference() {

    union() {
      // M30 male thread
      translate([0, 0, L - l2])
        threaded_rod(d=d, l=l2, pitch=pitch, anchor=[0, 0, -1], $slop=slop, $fa = 1, $fs = 0.5);

      shape = [
        [d1/2, L - l2 - (md - d1)/2],
        [d1/2, 3],
        [d2/2, 3],
        [d2/2, 0],
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
    cylinder(h=h1, d=22, $fn=6);

    // Subtract the pin hole
    cylinder(h = 3*L, d=ped, center=true, $fn = pfn);
  }
}


module extender_pin() {
  cylinder(h = L, d=pid, center=false, $fn = pfn);
}
