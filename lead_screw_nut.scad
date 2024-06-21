$fn=100;

module lead_screw_nut() {
    color("DarkGoldenrod",1.0) difference() {
        union() {
           cylinder(r=5,h=10.5);
           translate([0,0,5]) cylinder(r=11,h=3.5);
        }
        
        translate([0,0,-1]) cylinder(r=4,h=12.5);

        translate([7.75,0,4]) cylinder(r=1.5,h=5.5);
        translate([0,7.75,4]) cylinder(r=1.5,h=5.5);
        translate([-7.75,0,4]) cylinder(r=1.5,h=5.5);
        translate([0,-7.75,4]) cylinder(r=1.5,h=5.5);
    }
}

lead_screw_nut();