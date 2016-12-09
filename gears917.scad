
include<MCAD/involute_gears.scad>;

$fn=64;

//distance_between_axles = 36.835; // bwax 22.1
distance_between_axles = 48.585; // bwax 29.15

gear1_teeth=20;
gear2_teeth=gear1_teeth*4;

t1 = gear1_teeth;
t2 = gear2_teeth;
cp = 360*distance_between_axles/(t1+t2);
g1p_d  =  t1 * cp / 180;
g2p_d  =  t2 * cp / 180;
g1p_r   = g1p_d/2;
g2p_r   = g2p_d/2;

het=5;
hep=4;
heb=8;
sd=20;

echo("bwax",g1p_r-g2p_r);

translate([g1p_r,0,0])
rotate([180,0,0])
	large_gear();
translate([g2p_r,0,0])
rotate([180,0,0])
	small_gear();


module small_gear(){
translate ([0,0,0]) difference(){
	gear (
	number_of_teeth=gear1_teeth,
	circular_pitch=cp, diametral_pitch=false,
	pressure_angle=28,
	clearance = 0.2,
	gear_thickness=het,
	rim_thickness=het,
	rim_width=5.3,
	hub_thickness=het+heb,
	hub_diameter=sd,
	bore_diameter=1,
	circles=0,
	backlash=0,
	twist=0,
	involute_facets=0);
	//translate([0,0,11]) rotate([90,0,0]) cylinder(h=16,r=2.7/2,$fn=30);
	union()
	{
	for (r=[0:2])
	rotate([0,0,360/3*r]) {
		for (i=[0:3])
		translate([0,-4.5,het+heb/2+i]) rotate([90,90,0])cylinder(r=5.8/sqrt(3),h=2.5,$fn=6, center=true);
		//grub hole
		translate([0,0,het+heb/2]) rotate([90,0,0]) cylinder(r=1.5,h=10,$fn=8);
		translate([0,-sd/2+0.5,het+heb/2]) rotate([90,90,0]) cylinder(2, 3/2, 8/2, $fn=16, true);
	} // for
	// bore
	translate([0,0,-1]) cylinder(r=5.1/2,h=het+heb+2,$fn=16);

	}
}}

module large_gear(){
difference(){
	union(){
		cylinder(r=g2p_r+3,h=het+hep);
		//translate([0,0,-2.999]) cylinder(r2=5.5,r1=3,h=3);
	}
	translate([0,0,-1]) gear (
	number_of_teeth=gear2_teeth,
	circular_pitch=cp, diametral_pitch=false,
	pressure_angle=28,
	clearance = 0.2,
	gear_thickness=0,
	rim_thickness=het+1,
	rim_width=3,
	hub_thickness=0,
	hub_diameter=4,
	bore_diameter=0,
	circles=0,
	backlash=0,
	twist=0,
	involute_facets=0);
	
	translate([0,0,3]) cylinder(het+hep, 14.8/2, 14.8/2,$fn=6);
	translate([0,0,-1]) cylinder(3+1-0.2, 8.3/2, 8.3/2);

	difference(){
	union() {
		translate([0,0,-1])cylinder(r=g2p_r-3,h=20);
		translate([0,0,het])cylinder(1, g2p_r-2, g2p_r-3, true);
	} // un
		cylinder(r=10,h=20);
		for(i=[0:5])
		rotate([0,0,i*360/5])
		translate([0,g2p_r/2,het+hep/2+0.5])
			cube([5,g2p_r,hep],center=true);
	}	// df
}
}

