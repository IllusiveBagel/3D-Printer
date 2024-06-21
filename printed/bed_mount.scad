$fn=100;

module bed_mount(color="purple") {
    color(color,1.0) difference(){
        union() {
            cube([10,20,5],true);
            translate([0,-12.5,10]) cube([10,5,25],true);
            translate([0,-20,20]) cube([10,20,5],true);
        }
        cylinder(r=2.5,h=7,center=true);
        rotate(90,[1,0,0]) translate([0,12.5,13]) cylinder(r=2.5,h=7,center=true);
        translate([0,-24.5,20]) cylinder(r=1.5,h=7,center=true);
    }
}

bed_mount();