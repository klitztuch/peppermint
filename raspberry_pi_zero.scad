$fn = 50;

corner_radius = 3;

width = 65;
height = 30;
mounting_hole_diameter = 2.75;
mounting_hole_offset = 3.5;


module pi_zero_body(){
    minkowski(){
        square([width - corner_radius * 2, height - corner_radius * 2]);
        circle(corner_radius);
    }
}

module hole(){
    circle(d = mounting_hole_diameter);
}

module holes(){
    
    translate([-corner_radius + mounting_hole_offset, -corner_radius + mounting_hole_offset, 0]){
        hole();
    }
    translate([-corner_radius + width - mounting_hole_offset, -corner_radius + mounting_hole_offset, 0]){
        hole();
    }
    translate([-corner_radius + width - mounting_hole_offset, -corner_radius +  height - mounting_hole_offset, 0]){
        hole();
    }

    translate([-corner_radius + mounting_hole_offset, -corner_radius +  height - mounting_hole_offset, 0]){
        hole();
    }
}

linear_extrude(2){
    difference() {
        pi_zero_body();
        holes();
        
    }
}
