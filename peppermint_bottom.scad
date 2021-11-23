$fn = 50;

corner_radius = 12;
width = 90 - 2*corner_radius;
height = 56 - 2*corner_radius;

nut_diameter = 5;
nut_height = 2;

pi_zero_mount_x_distance = 58;
pi_zero_mount_y_distance = 23;
pi_zero_mount_x_offset = 3.5;
pi_zero_mount_y_offset = 3.5;

module peppermint_bottom_plate(){
    minkowski(){
        square([width, height]);
        circle(corner_radius
    );
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

module peppermint_bottom() {
    translate([corner_radius
, corner_radius
, 0]) {
        linear_extrude(2){
            difference(){
                peppermint_bottom_plate();
                translate([nut_diameter/2 + pi_zero_mount_x_offset, -(nut_diameter/2 + pi_zero_mount_y_offset),0]){
                    nut_holes();
                }
            }
        }
    }
    
}

peppermint_bottom();