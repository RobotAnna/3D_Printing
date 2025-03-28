breite=41;
tiefe =32;
hoehe1 =14;
hoehe2 =30;
radiusStange=23.5/2;
$fn=36;

module koerper(wand) {
    hull() {
        translate([-wand, -wand, 0]) 
        cube([3, tiefe+2*wand, hoehe2]);
        
        translate([breite-tiefe/2, tiefe/2, 0]) 
        cylinder(r=tiefe/2+wand, h=hoehe2);
    }
}

module haken() {
    minkowski() {
        hull() {
            rotate([0,90,0])
            scale([1,1.4,1])
            cylinder(d=6, h=.3);
            
            translate([10,0,12])
            cylinder(d=3, h=1);
        }
        sphere(r = 1);
    }
}

module deckel() {
  difference() {
    intersection() {
        translate([-1.5,-1.5,0])
        cube([breite+10, tiefe+10, 1.5]);
        koerper(1.5);
    }
    
    intersection() {
        translate([5,0,0])
        cube([breite-15, tiefe, 1.5]);
        koerper(0);
    }
    
  }
}

difference() {
    hoehe2 =40;    
    hoehe1 =0;
    
    union() {
        koerper(1.5);
        
        translate([breite, tiefe/2, hoehe2-22.5]) 
        haken();
    }

    koerper(0);
    
    //Glattschnitt unten
    /*translate([-24, -6,-10])
    rotate([0,45,0])
    cube([breite+50, tiefe+50, 30]);*/
    translate([-24, -6,-12])
    rotate([0,17,0])
    cube([breite+50, tiefe+50, 30]);
    
    translate([-2, tiefe/2, -3*radiusStange+hoehe2-hoehe1]) 
    rotate([0,90,0])
    cylinder(r=radiusStange, h=10);
    
    
    
}

    translate([0,0,hoehe2])
    deckel();





/* Backup 1. Version
difference() {
    union() {
        koerper(1.5);
        
        translate([breite, tiefe/2, 3]) 
        haken();
    }
    

    koerper(0);
    
    //Glattschnitt unten
    translate([-2, -2,-5])
    cube([breite+4, tiefe+4, 5]);
    
    translate([-2, tiefe/2, -radiusStange+(hoehe2-hoehe1)]) 
    rotate([0,90,0])
    cylinder(r=radiusStange, h=10);
}*/
