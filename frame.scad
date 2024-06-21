use <hardware/profile.scad>
use <hardware/bracket.scad>

module frame(bed_size,frame_spacing) {
    // Corners
    corner_length=bed_size+((frame_spacing*2)+120);
    corner_vector=(bed_size/2)+(frame_spacing+10);
    translate([corner_vector,corner_vector,0]) profile(corner_length);
    translate([-corner_vector,corner_vector,0]) profile(corner_length);
    translate([corner_vector,-corner_vector,0]) profile(corner_length);
    translate([-corner_vector,-corner_vector,0]) profile(corner_length);

    side_length=bed_size+(frame_spacing*2);

    // Bottom
    rotate(90,[0,1,0]) translate([-50,corner_vector,-corner_vector +10]) profile(side_length);
    rotate(90,[1,0,0]) translate([corner_vector,50,-corner_vector +10]) profile(side_length);
    rotate(-90,[0,1,0]) translate([50,-corner_vector,-corner_vector +10]) profile(side_length);
    rotate(-90,[1,0,0]) translate([-corner_vector,-50,-corner_vector +10])profile(side_length);

    // Top
    rotate(90,[0,1,0]) translate([-(corner_length-10),corner_vector,-corner_vector +10]) profile(side_length);
    rotate(90,[1,0,0]) translate([corner_vector,(corner_length-10),-corner_vector +10]) profile(side_length);
    rotate(-90,[0,1,0]) translate([(corner_length-10),-corner_vector,-corner_vector +10]) profile(side_length);
    rotate(-90,[1,0,0]) translate([-corner_vector,-(corner_length-10),-corner_vector +10])profile(side_length);

    // Rail
    rotate(90,[1,0,0]) translate([corner_vector,(corner_length-50),-corner_vector +10]) profile(side_length);
    rotate(-90,[1,0,0]) translate([-corner_vector,-(corner_length-50),-corner_vector +10])profile(side_length);

    // Brackets
    bracket_corner=(bed_size/2)+frame_spacing;

    // Top Brackets
    top_bracket_vector=[-bracket_corner,-bracket_corner,corner_length-18.5];
    translate(top_bracket_vector) bracket();
    rotate(90,[0,0,1]) translate(top_bracket_vector) bracket();
    rotate(180,[0,0,1]) translate(top_bracket_vector) bracket();
    rotate(270,[0,0,1]) translate(top_bracket_vector) bracket();

    // Bottom Brackets
    bottom_bracket_vector = [-bracket_corner,-bracket_corner,41.5];
    translate(bottom_bracket_vector) bracket();
    rotate(90,[0,0,1]) translate(bottom_bracket_vector) bracket();
    rotate(180,[0,0,1]) translate(bottom_bracket_vector) bracket();
    rotate(270,[0,0,1]) translate(bottom_bracket_vector) bracket();

    // Front Brackets
    translate([0,-(bed_size/2)-(frame_spacing+1.5),bracket_corner+60]) rotate(90,[1,0,0]) {
        translate([-bracket_corner,-bracket_corner,0]) bracket();
        rotate(90,[0,0,1]) translate([-bracket_corner,-bracket_corner,0]) bracket();
        rotate(180,[0,0,1]) translate([-bracket_corner,-bracket_corner-40,0]) bracket();
        rotate(270,[0,0,1]) translate([-bracket_corner-40,-bracket_corner,0]) bracket();
    }

    // Back Brackets
    translate([0,(bed_size/2)+(frame_spacing+18.5),bracket_corner+60]) rotate(90,[1,0,0]) {
        translate([-bracket_corner,-bracket_corner,0]) bracket();
        rotate(90,[0,0,1]) translate([-bracket_corner,-bracket_corner,0]) bracket();
        rotate(180,[0,0,1]) translate([-bracket_corner,-bracket_corner-40,0]) bracket();
        rotate(270,[0,0,1]) translate([-bracket_corner-40,-bracket_corner,0]) bracket();
    }

    side_bracket_vector=[-bracket_corner,-bracket_corner,0];
    side_bracket_height=(bed_size/2)+(60+frame_spacing);
    side_bracket_move=(bed_size/2)+(frame_spacing+1.5);

    // Right Brackets
    translate([side_bracket_move,0,side_bracket_height]) rotate(90,[0,1,0]) {
        translate(side_bracket_vector) bracket();
        rotate(90,[0,0,1]) translate(side_bracket_vector) bracket();
        rotate(180,[0,0,1]) translate(side_bracket_vector) bracket();
        rotate(270,[0,0,1]) translate(side_bracket_vector) bracket();
    }

    // Left Brackets
    translate([-side_bracket_move,0,side_bracket_height]) rotate(-90,[0,1,0]) {
        translate(side_bracket_vector) bracket();
        rotate(90,[0,0,1]) translate(side_bracket_vector) bracket();
        rotate(180,[0,0,1]) translate(side_bracket_vector) bracket();
        rotate(270,[0,0,1]) translate(side_bracket_vector) bracket();
    }

    // Top Brackets
    rotate(90,[0,1,0]) translate([-corner_length+20,-bracket_corner,bracket_corner+1.5]) bracket();
    rotate(180,[0,0,1]) rotate(90,[0,1,0]) translate([-corner_length+20,-bracket_corner,bracket_corner+1.5]) bracket();
    rotate(90,[0,1,0]) translate([-corner_length+20,-bracket_corner,-bracket_corner-18.5]) bracket();
    rotate(180,[0,0,1]) rotate(90,[0,1,0]) translate([-corner_length+20,-bracket_corner,-bracket_corner-18.5]) bracket();
}

frame(220);