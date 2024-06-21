use <../hardware/lead_screw_nut.scad>

$fn=100;

module z_nut_mount(frame_spacing, color="purple") {
    color(color,1.0) difference() {
        union(){
            hull() {
                translate([-31,-20,-5]) cube([62,25,5]);
                translate([0,frame_spacing-1,-5]) cylinder(r=11,h=5);
            }

            hull() {
                translate([-31,-20,20]) cube([62,25,5]);
                translate([0,frame_spacing-1,20]) cylinder(r=11,h=5);
            }

            translate([0,2.5,10]) cube([62,5,20],true);
        }

        hull() {
            translate([21,-10,-6]) cylinder(r=2.5,h=32);
            translate([-21,-10,-6]) cylinder(r=2.5,h=32);
        }

        rotate(90,[1,0,0]) translate([21,10,-6]) cylinder(r=2.5,h=7);
        rotate(90,[1,0,0]) translate([-21,10,-6]) cylinder(r=2.5,h=7);

        translate([-5,-13,-6]) cube([10,6,32]);
        translate([0,frame_spacing-1,-6]) cylinder(r=5,h=32);

        translate([0,frame_spacing+6.75,-6]) cylinder(r=1.5,h=32);
        translate([0,frame_spacing-8.75,-6]) cylinder(r=1.5,h=32);
        translate([7.5,frame_spacing-1,-6]) cylinder(r=1.5,h=32);
        translate([-7.5,frame_spacing-1,-6]) cylinder(r=1.5,h=32);

        translate([7.75,0,-1]) cylinder(r=1.5,h=5.5);
    }
}

z_nut_mount(40);
translate([0,39,20]) lead_screw_nut();