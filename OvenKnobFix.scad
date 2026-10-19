/*
Parametric LG Stove Knob Replacement
------------------------------------
A durable replacement block for LG oven/stove knobs. 

PRINT ORIENTATION IS CRITICAL: Lay the block completely flat on its side 
so the layer lines run longitudinally down the column. Do NOT print upright.
Use ABS, ASA, or PC (Do not use PLA or PETG for the main body).

Customizable Variables:
*/

$fn = 100;

// --- Block Body Dimensions ---
block_width = 29;    // Total length of the recessed block
block_depth = 13;    // Width of the block
block_height = 22.5; // Total depth including the ledge

// --- Mounting Flanges (Ledge) ---
flange_width = 44;   // Total tip-to-tip width across both ears
flange_thick = 2;    // Ledge thickness
screw_spacing = 32;  // Center-to-center distance of screw holes
screw_dia = 6;       // Diameter of the screw holes
post_clearance_dia = 9; // Diameter of the screw post clearance

// --- Extended Column ---
col_dia = 9.5;       // MUST clear the hole in the metal backplate
col_reach = 10;      // Extension distance to reach the stove peg

// --- D-Shaft Socket ---
d_dia = 6.2;         // Diameter of the stove's D-shaft
d_flat = 4.7;        // Distance from the flat edge to the round edge
d_depth = 12;        // Depth of the D-shaft hole
d_angle = 90;        // Rotation angle to align the flat side

difference() {
    // --- Solid Geometry ---
    union() {
        // Main solid body
        translate([-block_width/2, -block_depth/2, 0])
            cube([block_width, block_depth, block_height]);
        
        // Mounting flanges
        translate([-flange_width/2, -block_depth/2, 0])
            cube([flange_width, block_depth, flange_thick]);
            
        // Extended central column
        translate([0, 0, -col_reach])
            cylinder(d=col_dia, h=col_reach + 0.1);
    }
    
    // --- Subtractions ---
    // 1. Screw holes
    translate([-screw_spacing/2, 0, -1])
        cylinder(d=screw_dia, h=block_height + 2);
    translate([screw_spacing/2, 0, -1])
        cylinder(d=screw_dia, h=block_height + 2);
        
    // 2. Clearances for the outer shell's screw posts
    translate([-screw_spacing/2, 0, flange_thick])
        cylinder(d=post_clearance_dia, h=block_height);
    translate([screw_spacing/2, 0, flange_thick])
        cylinder(d=post_clearance_dia, h=block_height);
        
    // 3. D-Shaft Socket
    translate([0, 0, -col_reach - 1])
    rotate([0, 0, d_angle])
    difference() {
        cylinder(d=d_dia, h=d_depth + 1);
        translate([-d_dia/2, d_flat - (d_dia/2), -1])
            cube([d_dia, d_dia, d_depth + 3]);
    }
}