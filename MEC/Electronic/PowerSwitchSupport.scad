// Support for Power Switch on 2020 Extrusion
$fn = 52;
// Switch Dimensions
Sw_W = 13+0.6;
Sw_L = 20+0.6;
Sw_H = 21;

// Screw
Screw_d = 3+0.6;

// Extrusion
Ext = 20;

// Support Dimensions
// Thickness
Sup_T = 3;
Sup_W = Sw_W + 2*Sup_T;
Sup_H = Sup_T + Sw_H + Ext;
Sup_L = 25;

// Model

difference(){
    union(){
        cube([Sup_T,Sup_L,Sup_H]);
        translate([Sup_T,0,Sup_H-Sup_T]) cube([Sup_W,Sup_L,Sup_T]);
    }
    
    // Switch
    #translate([Sup_T+Sup_W/2,Sup_L/2,Sup_H-Sw_H/2+Sup_T]) cube([Sw_W,Sw_L,Sw_H],center = true);
    // Screw
    translate([0,Sup_L*1.5/6,Ext/2]) rotate([0,90,0]) cylinder(d=Screw_d,h = Sup_T*3,center = true);
    translate([0,Sup_L*4.5/6,Ext/2]) rotate([0,90,0]) cylinder(d=Screw_d,h = Sup_T*3,center = true);

}