module rod_cap(color="purple") {
    $fn=100;
    color(color,1.0) difference() {
        union() {
            cube([25,40,4],true);
            translate([-1.5,0,0]) cylinder(r=9,h=15);
            translate([10,0,-11]) cube([5,40,22],true);
        }
        translate([-1.5,0,-3]) cylinder(r=6,h=19);
        translate([-2.5,14.5,-11]) cylinder(r=2.5,h=25);
        translate([-2.5,-14.5,-11]) cylinder(r=2.5,h=25);

        rotate(90,[0,1,0]) translate([12.5,-14.5,-11]) cylinder(r=2.5,h=25);
        rotate(90,[0,1,0]) translate([12.5,14.5,-11]) cylinder(r=2.5,h=25);
    }
}

rod_cap();