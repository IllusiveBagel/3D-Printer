module rod_cap(color="purple") {
    $fn=100;
    color(color,1.0) difference() {
        union() {
            cube([20,40,4],true);
            translate([1,0,0]) cylinder(r=9,h=15);
        }
        translate([1,0,-3]) cylinder(r=6,h=19);
        translate([0,14.5,-11]) cylinder(r=2.5,h=25);
        translate([0,-14.5,-11]) cylinder(r=2.5,h=25);
    }
}

rod_cap();