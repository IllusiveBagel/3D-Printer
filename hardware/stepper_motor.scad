$fn=100;

module stepper_motor(lead_screw=false) {
    difference() {
        union() {
            color("black",1.0)
                translate([0,0,9.5]) 
                    linear_extrude(20) 
                        polygon([[-21,0], [-21,-13], [-13,-21], [13,-21],[21,-13],[21,13],[13,21],[-13,21],[-21,13]]);

            color("silver",1.0) {
                linear_extrude(9.5) 
                    polygon([[-21,0], [-21,-17], [-17,-21], [17,-21],[21,-17],[21,17],[17,21],[-17,21],[-21,17]]);
                translate([0,0,29.5]) 
                    linear_extrude(7.5) 
                        polygon([[-21,0], [-21,-17], [-17,-21], [17,-21],[21,-17],[21,17],[17,21],[-17,21],[-21,17]]);
                translate([0,0,37]) cylinder(r=11,h=2);
            }
        }

        color("silver",1.0) {
            translate([0,0,36]) cylinder(r=5,h=4);
            translate([15.5,15.5,32]) cylinder(r=1.5,h=6);
            translate([-15.5,15.5,32]) cylinder(r=1.5,h=6);
            translate([15.5,-15.5,32]) cylinder(r=1.5,h=6);
            translate([-15.5,-15.5,32]) cylinder(r=1.5,h=6);
        }
    }

    if(lead_screw) {
        color("silver",1.0) translate([0,0,36]) cylinder(r=4,h=313);
    }
    else {
        color("silver",1.0) difference() {
            translate([0,0,36]) cylinder(r=2.55,h=25);
            translate([0,-4.5,52]) cube([6,6,19],true);
        } 
    }
}

stepper_motor(true);