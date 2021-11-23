use <raspberry_pi_zero.scad>
use <peppermint_top.scad>
use <peppermint_bottom.scad>

case_inner_height = 18;
case_inner_node = 2;
case_total_height = case_inner_height + case_inner_node;

peppermint_bottom();
translate([0, 0, 15]) {
    peppermint_top();
}

// Raspberry Pi Zero
translate([0, 0, 3]) {
    raspberry_pi_zero();
}