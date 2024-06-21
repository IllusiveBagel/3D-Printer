use <hardware/bed.scad>
use <hardware/rail.scad>
use <hardware/linear_bearing.scad>
use <hardware/profile.scad>
use <hardware/stepper_motor.scad>
use <hardware/lead_screw_nut.scad>

use <printed/rod_cap.scad>
use <printed/bed_rail.scad>
use <printed/bed_rail_clip.scad>
use <printed/bed_mount.scad>
use <printed/z_motor_mount.scad>
use <printed/z_nut_mount.scad>

use <frame.scad>
use <bed_frame.scad>

$fn=100;
bed_size = 220;
frame_spacing = 40;
bed_height = 110;

// 2020 Frame
frame(bed_size,frame_spacing);

// Linear Rails
rail_vector=[-((bed_size/2)+frame_spacing),bed_size+((frame_spacing*2)+65.5),-((bed_size/2)+frame_spacing)];
rotate(90,[1,0,0]) translate(rail_vector) rail(bed_size+(frame_spacing*2));
rotate(90,[1,0,0]) rotate(180,[0,1,0]) translate(rail_vector) rail(bed_size+(frame_spacing*2));

// Z-axis Rods
z_rod_x = ((bed_size/2)+(frame_spacing+10)+1);
z_rod_y = (bed_size/2)-45;

color("silver", 1.0) {
    translate([z_rod_x,z_rod_y,60]) cylinder(r=6,h=bed_size+(frame_spacing*2),center=false);
    translate([z_rod_x,-z_rod_y,60]) cylinder(r=6,h=bed_size+(frame_spacing*2),center=false);
    translate([-z_rod_x,z_rod_y,60]) cylinder(r=6,h=bed_size+(frame_spacing*2),center=false);
    translate([-z_rod_x,-z_rod_y,60]) cylinder(r=6,h=bed_size+(frame_spacing*2),center=false);
}

// Z-axis Rod Caps
translate([z_rod_x+1.5,z_rod_y,62]) rod_cap();
translate([z_rod_x+1.5,-z_rod_y,62]) rod_cap();
rotate(180,[0,0,1]) translate([z_rod_x+1.5,z_rod_y,62]) rod_cap();
rotate(180,[0,0,1]) translate([z_rod_x+1.5,-z_rod_y,62]) rod_cap();

z_rod_z=-(bed_size+(frame_spacing*2)+58);
rotate(180,[0,1,0]) translate([z_rod_x+2.5,z_rod_y,z_rod_z]) rod_cap();
rotate(180,[0,1,0]) translate([z_rod_x+2.5,-z_rod_y,z_rod_z]) rod_cap();
rotate(180,[1,0,0]) translate([z_rod_x+2.5,z_rod_y,z_rod_z]) rod_cap();
rotate(180,[1,0,0]) translate([z_rod_x+2.5,-z_rod_y,z_rod_z]) rod_cap();

// Z-Axis Bearings
translate([z_rod_x,z_rod_y,bed_height]) linear_bearing();
translate([z_rod_x,-z_rod_y,bed_height]) linear_bearing();
translate([-z_rod_x,z_rod_y,bed_height]) linear_bearing();
translate([-z_rod_x,-z_rod_y,bed_height]) linear_bearing();

// Bed Frame
bed_frame(bed_size,frame_spacing,bed_height);

// Bed Rails
rotate(90,[0,0,1]) translate([z_rod_y,z_rod_x-5.25,bed_height]) bed_rail();
rotate(90,[0,0,1]) translate([-z_rod_y,z_rod_x-5.25,bed_height]) bed_rail();
rotate(-90,[0,0,1]) translate([z_rod_y,z_rod_x-5.25,bed_height]) bed_rail();
rotate(-90,[0,0,1]) translate([-z_rod_y,z_rod_x-5.25,bed_height]) bed_rail();

rotate(90,[0,0,1]) translate([z_rod_y,z_rod_x+7,bed_height-15]) bed_rail_clip();
rotate(90,[0,0,1]) translate([z_rod_y,z_rod_x+7,bed_height+15]) bed_rail_clip();

rotate(90,[0,0,1]) translate([-z_rod_y,z_rod_x+7,bed_height-15]) bed_rail_clip();
rotate(90,[0,0,1]) translate([-z_rod_y,z_rod_x+7,bed_height+15]) bed_rail_clip();

rotate(-90,[0,0,1]) translate([z_rod_y,z_rod_x+7,bed_height-15]) bed_rail_clip();
rotate(-90,[0,0,1]) translate([z_rod_y,z_rod_x+7,bed_height+15]) bed_rail_clip();

rotate(-90,[0,0,1]) translate([-z_rod_y,z_rod_x+7,bed_height-15]) bed_rail_clip();
rotate(-90,[0,0,1]) translate([-z_rod_y,z_rod_x+7,bed_height+15]) bed_rail_clip();

translate([(bed_size/2)-5.5,-((bed_size/2)-30),bed_height-12.5]) bed_mount();
translate([-((bed_size/2)-5.5),-((bed_size/2)-30),bed_height-12.5]) bed_mount();
rotate(180,[0,0,1]) translate([(bed_size/2)-5.5,-((bed_size/2)-30),bed_height-12.5]) bed_mount();
rotate(180,[0,0,1]) translate([-((bed_size/2)-5.5),-((bed_size/2)-30),bed_height-12.5]) bed_mount();

translate([0,(bed_size/2)-20,bed_height-10]) z_nut_mount(frame_spacing);
translate([0,(bed_size/2)+(frame_spacing-21),bed_height+10]) lead_screw_nut();
translate([0,(bed_size/2)+(frame_spacing-21),bed_height-10]) rotate(180,[1,0,0]) lead_screw_nut();

translate([0,0,bed_height+16]) bed(bed_size);

// Z-Axis Motor
translate([0,(bed_size/2)+(frame_spacing-21),60]) z_motor_mount();
translate([0,(bed_size/2)+(frame_spacing-21),23]) stepper_motor(true);
