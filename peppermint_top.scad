$fn = 50;

r = 10;
width = 90 - 2*r;
height = 56 - 2*r;

waveshare_width = 56;
waveshare_heigth = 29;

module peppermint_top(){
    minkowski(){
        square([width, height]);
        circle(r);
    }
}

module waveshare_display(){
    square([waveshare_width, waveshare_heigth]);
}

linear_extrude(2){
    difference(){
        peppermint_top();
        translate([0, -r, 0]){
            waveshare_display();
        }
    }
}
