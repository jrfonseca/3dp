include <BOSL2/std.scad>
include <BOSL2/rounding.scad>


fn = $preview ? 64 : 128;


gap = 2.0;

d1_ = 39.5;
d2_ = 51.5;
h_ = 10.8;

// Extend the conic surface so there's an extra gap around the major diameter
d1 = d1_;
d2 = d2_ + gap;
h  = h_  + h_*gap/(d2 - d1);


// large number;
L = 100;


// back offset
b = 21.8 + 36.3/2;

// arm thickness
t = 10;

// body width
w = d2 + 2*t;


wand_section = [
  [0, -L],
  [d1/2, -L],
  [d1/2, -h],
  [d2/2, 0],
  [d2/2, L],
  [0, L],
];


body_section = [
  [-b, -w/2],
  [w/4, -w/2],
  [w/4, 0],
  [0, 0],
  [-d2/2, d2/2],
  [-b, d2/2],
];

body_section_radii = [0, 2, 2, 0, 2, 0];

body_section_rounded = round_corners(body_section, radius = body_section_radii, $fa=1, $fs=0.5);


// screw diameters (clearance hole and head)
sd1 = 4.0;
sd2 = 8.0;

screw_section = [
  [0, -L],
  [sd1/2, -L],
  [sd1/2, -(sd2-sd1)/2],
  [sd2/2 + sd2, sd2],
  [0, sd2],
];


rotate([0, -90, 0])
difference() {

  // body
  rotate([90, 0, 0])
  linear_extrude(height=w, center=true, $fn=fn)
  polygon(points=body_section_rounded);

  // wand rest shape
  rotate_extrude($fn = fn)
  polygon(wand_section);

  // wand insertion/extraction path
  translate([0, 0, h*2/3])
  rotate([0, 90, 0])
  rotate([0, 0, 90])
  union() {
    mirror([1, 0, 0])
    linear_extrude(height=L, center=false, $fn=fn)
    polygon(wand_section);

    linear_extrude(height=L, center=false, $fn=fn)
    polygon(wand_section);
  }

  // screw hole
  translate([-d2/2, 0, sd2/2])
  rotate([0, 90, 0])
  rotate_extrude($fn = fn)
  polygon(screw_section);
}
