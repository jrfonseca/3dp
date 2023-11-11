// FIXME: Needs to be calibrated as explained in
// https://github.com/revarbat/BOSL2/wiki/constants.scad#constant-slop
slop = 0.10;

L = 135;

od = 40;

// Pin
pid = 6; // internal diameter
ped = pid + 4*slop;  // external diameter
pfn = $preview ? 32 : 64;  // $fn

d = 30;
l1 = 6;
l2 = 6;
pitch = 1.5;

// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Other_Language_Features#$fa,_$fs_and_$fn

fn = $preview ? 64 : 128;
