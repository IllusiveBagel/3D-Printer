$fn=100;
module carriage() {
    color("darkgray",1.0) difference() {
        linear_extrude(40) polygon([[8,0],[0,0],[0,5.5],[4,5.5],[4,14.5],[0,14.5],[0,20],[8,20]]);

        // Screw holes
        rotate(90,[0,1,0]) translate([-12,3.5,4]) cylinder(r=1.5, h=5, center = false);
        rotate(90,[0,1,0]) translate([-12,17,4]) cylinder(r=1.5, h=5, center = false);

        rotate(90,[0,1,0]) translate([-28,3.5,4]) cylinder(r=1.5, h=5, center = false);
        rotate(90,[0,1,0]) translate([-28,17,4]) cylinder(r=1.5, h=5, center = false);
    }
}

module rail(length) {
    translate([-4.5,0,0]) rotate(-90,[0,0,1]) {
    color("silver", 1.0) difference() {
        linear_extrude(length) polygon([[0,0],[3.2,0],[4,1],[4.8,0],[6,0],[6,9],[4.8,9],[4,8],[3.2,9],[0,9]]);

        for(i = [7.5:20:length]) {
            rotate(90, [0,1,0]) translate([-i + 1.5,4.5,-1]) cylinder(h=8, r=1.5, center = false);
        }
    }

    translate([2,-5.5,length/2-20]) carriage();
    }
}

rail(300);