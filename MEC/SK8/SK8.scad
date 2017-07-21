$fn = 50;

// SK8 Original Dimensions
h = 20;
E = 21;
W = 45; // Original W = 42
L = 14;
F = 32.8;
G = 6;
P = 18;
B = 32;
S = 5.5;
Set_screw = 3+0.4;  // M3   Original is M4
Attach_Screws = 5+0.6; //M5
rod_dia = 8+0.4;

// *** SK8 *** \\
// Base
module sk8_base(){
    difference(){
        translate([-W/2,0,0]) cube([W,L,G]);
        translate([-B/2,L/2,-0.5*G]) cylinder(d=Attach_Screws,2*G,true);
        translate([+B/2,L/2,-0.5*G]) cylinder(d=Attach_Screws,2*G,true);
    }
}

// Top
module sk8_top(){
    difference(){
        translate([-P/2,0,0]) cube([P,L,F]);
        // Rod
        translate([0,1.5*L,h]) rotate([90,0,0]) cylinder(d=rod_dia,2*L,true);
        // Set Screw
        translate([-P,L/2,h+8]) rotate([90,0,90]) cylinder(d=Set_screw,2*P,true);
        // Split
        translate([-1/5*rod_dia/2,-0.5*L,h]) cube([1/5*rod_dia,2*L,h]);
    }
}

sk8_base();
sk8_top();