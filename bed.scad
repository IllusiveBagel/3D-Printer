$fn=100;

module bed(size) {
    radius=5;
    color("silver", 1.0) difference() {
        minkowski()
        {
            cube([size-(radius*2),size-(radius*2),2],true);
            cylinder(r=radius,h=1);
        }

        screw_location = (size/2) - 5.5;
        translate([screw_location,screw_location,0]) cylinder(r=1.5,h=5,center=true);
        translate([-screw_location,screw_location,0]) cylinder(r=1.5,h=5,center=true);
        translate([screw_location,-screw_location,0]) cylinder(r=1.5,h=5,center=true);
        translate([-screw_location,-screw_location,0]) cylinder(r=1.5,h=5,center=true);

        translate([screw_location,screw_location,1]) cylinder(r1=1.5,r2=4.5,h=3,center=true);
        translate([-screw_location,screw_location,1]) cylinder(r1=1.5,r2=4.5,h=3,center=true);
        translate([screw_location,-screw_location,1]) cylinder(r1=1.5,r2=4.5,h=3,center=true);
        translate([-screw_location,-screw_location,1]) cylinder(r1=1.5,r2=4.5,h=3,center=true);
    }
}

bed(220);