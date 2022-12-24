// Replacement cap for Braun No Touch + Forehead Thermometer NTF3000
// https://www.braunhealthcare.com/uk_en/braun-no-touch-forehead
// I lost my cap, so shape was made from the thermometer itself, not another cap.
include <BOSL2/std.scad>
include <BOSL2/rounding.scad>

// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Other_Language_Features#$fa,_$fs_and_$fn
$fa = 1;
$fs = 0.1;

// Dimensions of the void
h = 8; // height
r1 = 31.8/2; // inner radius
r2 = 34.4/2; // outer radius

// thickness
t = 1.5;

// https://github.com/revarbat/BOSL2/wiki/rounding.scad#function-round_corners
shape = [
  [0, 0],
  [r1, 0],
  [r2, h],
  [r2 + t, h],
  [r1 + t - (r2 - r1)*t/h, -t],
  [0, -t]
];
radii = [0, 1.0, 0.5, 0.5, 1.0, 0];
rotate_extrude()
  polygon(round_corners(shape, radius = radii));
