use <../hardware/stepper_motor.scad>

$fn=100;

module z_motor_mount(color="purple") {
    color(color,1.0) union(){
        difference() {
            translate([-21,-21,0]) cube([42,42,5]);
            translate([0,0,-1]) cylinder(r=11,h=7);

            translate([15.5,15.5,-1]) cylinder(r=1.5,h=7);
            translate([-15.5,15.5,-1]) cylinder(r=1.5,h=7);
            translate([15.5,-15.5,-1]) cylinder(r=1.5,h=7);
            translate([-15.5,-15.5,-1]) cylinder(r=1.5,h=7);
        }

        difference() {
            translate([-21,21,0]) cube([42,20,5]);

            translate([0,31,0]) hull() {
                translate([11.5,0,-1]) cylinder(r=2.5,h=7);
                translate([-11.5,0,-1]) cylinder(r=2.5,h=7);
            }
            translate([-5,28,-1]) cube([10,6,7]);
        }

        translate([21,-21,0]) linear_extrude(5) polygon([[0,0],[0,42],[20,42],[20,37]]);
        translate([-21,-21,0]) linear_extrude(5) polygon([[0,0],[0,42],[-20,42],[-20,37]]);

        difference() {
            translate([-31,18.5,-10]) cube([20,5,20],true);
            translate([-31,18.5,-10]) rotate(90,[1,0,0]) cylinder(r=2.5,h=7,center=true);
        }

        difference() {
            translate([31,18.5,-10]) cube([20,5,20],true);
            translate([31,18.5,-10]) rotate(90,[1,0,0]) cylinder(r=2.5,h=7,center=true);
        }
    }

}

z_motor_mount();
translate([0,0,-37]) stepper_motor();