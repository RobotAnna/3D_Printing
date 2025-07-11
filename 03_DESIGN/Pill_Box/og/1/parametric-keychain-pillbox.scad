// parametric keychain pill box, disk-shaped
// by DrJones   printables.com/@DrJones   makerworld.com/@DrJones  
// license: CC-BY

//inside height in mm
inside_height=6.5; // [3.5:0.1:50]
//inside diameter in mm
inside_diameter=18.5; //[1:0.1:60]
//height of bottom part; will be limited by minimum height and minimum thread length
bottom_height=1.5; // [1.5:0.1:50] 
//keychain hole diameter
hole_diameter=4; // [2:0.5:10]
//height of keychain attachment (limited by cap height)
hole_height=5; //[1.7:0.1:10]
//tolerance
tol=0.2; // [0.1:0.02:0.5]

/* [Hidden] */
$fn=96;
d=inside_diameter; ds=d+1.6; D=ds+1.6+2*tol+1.6;
h=inside_height;H=h+1.6;
split=max(1.5,min(bottom_height,H-3.7));

thing();

module thing(){
  difference(){union(){ cylinder(h=0.5,d1=D,d2=D+1);up(0.5)cylinder(h=split-.5,d=D+1); screwx(); }
    up(0.8)cylinder(h=h+.01,d=d);
    for(a=[0:360/round(2*D):359.7])rotate([0,0,a])translate([D/2+.5,0,0])cylinder(h=split,r=0.5);
  }
  translate([D+5,0,H])rotate([180,0,0]) //up(10.1)
  difference(){
    union(){  up(split)cylinder(h=H-split-0.5,d=D);up(H-0.5)cylinder(h=0.5,d1=D,d2=D-1); hanger(); }
    up(0.8)cylinder(h=h,d=d);
    up(split)cylinder(h=.8,d1=ds+1.6,d2=ds);
    screwx(tol);
  }
}

module hanger(){ hh=min(H-split,hole_height); up(H-hh)difference(){ 
  hull()for(x=[0,D/2+hole_diameter/2+0.5])translate([x,0,0])ccyl(hh,hole_diameter+3.1,-0.5); 
  translate([D/2+hole_diameter/2+0.5,0,0])ccyl(hh,hole_diameter,0.5);  }
}

module screwx(tol=0){ up(0.8)cylinder(h=h,d=ds+2*tol); up(split)screw(h=min(h+.8-split,3.5),d=ds+2*tol); }
module up(z){translate([0,0,z])children();}
module screw(d,h){intersection(){cylinder(h=h,d1=d+2*h,d2=d); linear_extrude(h,twist=-180*h)translate([0.4,0,0])circle(d=d+.8);}}
module ccyl(h,d,c){cylinder(h=abs(c),d1=d+2*c,d2=d);up(abs(c))cylinder(h=h-2*abs(c),d=d);up(h-abs(c))cylinder(h=abs(c),d2=d+2*c,d1=d);}


