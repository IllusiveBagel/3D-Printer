use <bed_rail.scad>
use <../hardware/linear_bearing.scad>

$fn=100;

module bed_rail_clip(color="purple") {
    color(color, 1.0) difference() {
        hull() {
            translate([0,-5,0]) cube([32,5,12],true);
            translate([0,-7.5,0]) cylinder(r=13.5,h=12,center=true);
        }
        translate([0,-7.25,0]) cylinder(r=10.5,h=57,center=true);

        rotate(90,[1,0,0]) translate([13,0,-7]) cylinder(r=1.5,h=14);
        rotate(90,[1,0,0]) translate([-13,0,-7]) cylinder(r=1.5,h=14);

        rotate(90,[1,0,0]) translate([13,0,-5.5]) cylinder(r=3,h=8);
        rotate(90,[1,0,0]) translate([-13,0,-5.5]) cylinder(r=3,h=8);

        translate([16,1.5,0]) cube([6,8,6],true);
        translate([-16,1.5,0]) cube([6,8,6],true);

        translate([0,-16.25,0]) cube([34,19.5,14],true);
    }
}

bed_rail_clip();