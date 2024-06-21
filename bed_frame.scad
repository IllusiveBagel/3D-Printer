use <hardware/profile.scad>
use <hardware/bracket.scad>

module bed_frame(bed_size,frame_spacing,bed_height) {
    // Bed Frame
    rotate(90,[1,0,0]) translate([(bed_size/2)+(frame_spacing-10),bed_height,-(bed_size/2)+20]) profile(bed_size-40);
    rotate(90,[1,0,0]) translate([-((bed_size/2)+(frame_spacing-10)),bed_height,-(bed_size/2)+20]) profile(bed_size-40);

    bed_mid_size=bed_size+((frame_spacing*2)-40);
    bed_mid_x=-((bed_size/2)+(frame_spacing-20));
    rotate(90,[0,1,0]) translate([-bed_height,(bed_size/2)-30,bed_mid_x]) profile(bed_mid_size);
    rotate(90,[0,1,0]) translate([-bed_height,-((bed_size/2)-30),bed_mid_x]) profile(bed_mid_size);
    rotate(90,[0,1,0]) translate([-bed_height,0,bed_mid_x]) profile(bed_mid_size);

    // Bed Frame Brackets
    bed_bracket=(bed_size/2)+((frame_spacing)-20);
    bed_bracket_x=-((bed_size/2)-40);
    echo(bed_bracket_x);

    translate([-bed_bracket,bed_bracket_x,bed_height-8.5]) bracket();
    rotate(90,[0,0,1]) translate([bed_bracket_x,-bed_bracket,bed_height-8.5]) bracket();
    rotate(180,[0,0,1]) translate([-bed_bracket,bed_bracket_x,bed_height-8.5]) bracket();
    rotate(270,[0,0,1]) translate([bed_bracket_x,-bed_bracket,bed_height-8.5]) bracket();

    translate([-bed_bracket,10,bed_height-8.5]) bracket();
    rotate(90,[0,0,1]) translate([10,-bed_bracket,bed_height-8.5]) bracket();
    rotate(180,[0,0,1]) translate([-bed_bracket,10,bed_height-8.5]) bracket();
    rotate(270,[0,0,1]) translate([10,-bed_bracket,bed_height-8.5]) bracket();
}

bed_frame(22,30,0);