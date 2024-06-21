$fn=100;

module linear_bearing() {
    color("darkgray",1.0) difference() {
        cylinder(r=10.5,h=57,center=true);
        cylinder(r=6,h=59,center=true);
    }
}

linear_bearing();