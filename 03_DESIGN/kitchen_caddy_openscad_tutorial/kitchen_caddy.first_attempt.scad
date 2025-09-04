// Parameters
bottle_diameter = 52;
spacing         = 8;
nr_bottles      = 4;
tray_height     = 38;
tray_depth      = bottle_diameter + (2*spacing);


module tray(){

difference() {
union() {

    // rounded ends
    translate([tray_depth/2, 0, 0])
    cylinder(h=tray_height, d=tray_depth, center = false, $fn = 360);
    translate([tray_depth/2 + (nr_bottles-1) * (bottle_diameter + spacing), 0, 0])
    cylinder(h=tray_height, d=tray_depth, center = false, $fn = 360);

    // center block
    translate([tray_depth / 2,tray_depth / 2*-1,0]) 
    cube([(nr_bottles-1) * (bottle_diameter + spacing), tray_depth, tray_height]);
}

    // holes,
    for ( i = [0 : nr_bottles-1] ){
        translate([i * (bottle_diameter+spacing) + (bottle_diameter/2)+spacing, 0, spacing])
        cylinder(h=tray_height*1.5, d=bottle_diameter, $fn=128);
    }

  }
}


tray();


