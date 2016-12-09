// PRUSA i3 Z axis top holder, modified with thrust bearing positining cutouts 
//          for Z axis threaded rod
// PRUSA iteration3
// Z axis top holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

module z_top_base(){
 translate([0,-5,0]) cube([8,45,16]); // plate touching the base
 translate([0,-5,0]) cube([30,5.01,12]); // plate touching the base
 translate([0,-5,0]) cube([38,15,5]); // plate touching the base
 translate([0,-5,0]) cube([38,37,4]); // plate touching the base

}

module z_top_fancy(){
 // Corner cutouts
 translate([0.5,0.5,0]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);
 translate([0.5,40-0.5,0]) rotate([0,0,-45+90]) translate([-15,0,-1]) cube([30,30,51]);
 translate([-6,40+8,0]) rotate([0,0,-45-0]) translate([0,0,-1]) cube([20,20,51]);
 translate([8,0,12]) rotate([0,-45,0]) translate([0,-5,0]) cube([30,50,30]);
 translate([38-2.5,-5+2.5,0]) rotate([0,0,-45-90]) translate([-15,0,-1]) cube([30,30,51]);
 translate([45,0,0]) rotate([0,0,-45]) translate([-33,14,-1]) cube([10,10,51]);

 // cuts off the end of the x-y plate
 //translate([49,10,0]) translate([-15,0,-1]) cube([20,50,51]);

 //translate([0,0,5]) rotate([45+180,0,0]) rotate([0,0,-45+90]) translate([0,0,-15]) cube([30,30,30]);

// Stiffner cut out
 translate([30,0,5.5]) rotate([0,-45,0]) translate([0,-5,0]) cube([30,50,30]);

// 
}

module z_top_holes(){
 // Screw holes
 translate([-1,10,10]) rotate([0,90,0]) cylinder(h = 20, r=1.8, $fn=30);
 translate([-1,10+20,10]) rotate([0,90,0]) cylinder(h = 20, r=1.8, $fn=30);

 // Screw heads
 translate([4,10,10]) rotate([0,90,0]) cylinder(h = 20, r=3.1, $fn=30);
 translate([4,10-3.1,10]) cube([10,6.2,10]);
 translate([4,10+20,10]) rotate([0,90,0]) cylinder(h = 20, r=3.1, $fn=30);
 translate([4,10+20-3.1,10]) cube([10,6.2,10]);

 // Z rod holder
 translate([25+4.3,4.2,-1]) rotate([0,0,0]) cylinder(h = 50, r=4.1, $fn=15);
 translate([25+4.3-1,3,0.6]) cube([2,10,7]); // it's bit up because it helps with printing

 // drive shaft cutout
 translate([25+4.3,4.2+16.8,-1]) rotate([0,0,0]) cylinder(h = 50, r=3.0, $fn=15);
 translate([25+4.3,4.2+16.8,2]) rotate([0,0,0]) cylinder(h = 3, r=6.5, $fn=15);


}

// Final part
module z_top(){
 difference(){
  z_top_base();
  z_top_fancy();
  z_top_holes();
 }
 translate([0,-13,0]) mirror([0,1,0]) difference(){
  z_top_base();
  z_top_fancy();
  z_top_holes();
 }
}

z_top();