use <../hardware/rail.scad>
use <../hardware/profile.scad>

$fn=100;

module x_axis_mount() {
    translate([2.5,0,12.5]) cube([25,40,5],true);
    translate([17.5,0,-5]) cube([5,40,40],true);
    translate([30,-10,-22.5]) cube([20,20,5],true);
    translate([30,-10,2.5]) cube([20,20,5],true);
}

translate([0,-150,0]) rotate(-90,[1,0,0]) rail(300);
translate([20,-10,-10]) rotate(90,[0,1,0]) profile(300);
x_axis_mount();