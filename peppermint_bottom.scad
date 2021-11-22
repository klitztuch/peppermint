$fn = 50;

r = 10;
width = 90 - 2*r;
height = 56 - 2*r;

nut_diameter = 5.5;
nut_height = 2.4;

pi_zero_mount_x_distance = 58;
pi_zero_mount_y_distance = 23;
pi_zero_mount_x_offset = 3.5;
pi_zero_mount_y_offset = 3.5;

module peppermint_bottom(){
    minkowski(){
        square([width, height]);
        circle(r);
    }
}

module nut_hole(){
    circle(d = nut_diameter, $fn=6);
}

module nut_holes(){
    nut_hole();
    translate([pi_zero_mount_x_distance,0,0]){
        nut_hole();
    }
    translate([0,pi_zero_mount_y_distance,0]){
        nut_hole();
    }
    translate([pi_zero_mount_x_distance,pi_zero_mount_y_distance,0]){
        nut_hole();
    }
}

linear_extrude(2){
    difference(){
        peppermint_bottom();
        translate([nut_diameter/2 + pi_zero_mount_x_offset, -(nut_diameter/2 + pi_zero_mount_y_offset),0]){
            nut_holes();
        }
    }
}