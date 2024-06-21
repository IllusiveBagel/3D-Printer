$fn=100;

module bed_rail(color="purple") {
    color(color,1.0) difference() {
        union() {
            cube([32,12,63],true);
            difference() {
                translate([0,-3.5,0]) cube([50,5,20],true);
                rotate(90,[1,0,0]) translate([19.5,0,0]) cylinder(r=2.5,h=7);
                rotate(90,[1,0,0]) translate([-19.5,0,0]) cylinder(r=2.5,h=7);
            }
        }
        translate([0,5.25,0]) cylinder(r=10.5,h=57,center=true);
        translate([0,5.25,0]) cylinder(r=6,h=65,center=true);

        rotate(90,[1,0,0]) translate([19.5,0,-7]) cylinder(r=5,h=8);
        rotate(90,[1,0,0]) translate([-19.5,0,-7]) cylinder(r=5,h=8);

        rotate(90,[1,0,0]) translate([13,15,-7]) cylinder(r=1.5,h=14);
        rotate(90,[1,0,0]) translate([-13,15,-7]) cylinder(r=1.5,h=14);
        rotate(90,[1,0,0]) translate([13,-15,-7]) cylinder(r=1.5,h=14);
        rotate(90,[1,0,0]) translate([-13,-15,-7]) cylinder(r=1.5,h=14);
    }
}

bed_rail();