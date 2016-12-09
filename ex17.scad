
sbd=12;

include<MCAD/teardrop.scad>;

lay=0.2;

sbd=12;
sbdih=12+0.1;
sbd8=8;
sbd10=10;

bolt8=7.6;

lmuud=21;
lmuul=30;

belt=10;
belth=1.7;

m25d=2.5;
m25di=2.5+0.2;
m25dih=2.5+0.0;
m25shd=5.1;
m25l=11;
m25l1=17;	//15;

m3d=3;
m3di=3+0.3;
m3dih=3+0.1;
m3shd=7.5;

m3nd=6.2;
m3ndi=6.2+0.3;
m3ndih=6.2+0.1;
m3nh=2.6;


m4d=4;
m4di=4+0.3;
m4dih=4+0.1;

m4nd = 7.8;
m4ndi=7.8+0.3;
m4ndih=7.8+0.1;
m4nh=3.4;
m4shd=8.9+0.7;


m8d=8;
m8di=8+0.3;
m8dih=8+0.1;

sh8d=16+0.3;
m8nd=14.5+0.3;
sh8h=1.5;
m8nh=6.5;

688d=16;
688h=5;
688di=688d+0.3;
688dih=688d+0.1;

idd=13;
iddi=13.5;
idi=6;
idh=5;


motx=42.3;	//28.2;	//42.3;
motl=39.2;	//44.8;	//39.2;
motl1=2;
motbd=22+1;	//23;
motvl=18.2;
motbwo=31;	//23;
motd=5;
motdi=5+0.8;
motbl=m3dih;
motsh=m3shd;

w4=4;
w=5;
w6=6;
sw=1.5;

g1d=20;	//18;
g1h1=5;
g1h2=8;
g1h=g1h1+g1h2;
g2d=65;
g2h=9;

fild=1.75;
fildi=2.2;
fw=0.6;

bwax=688d/2+motx/2;
echo(bwax);
osx=sbd8/2;

boltl=35;

x=motx;
y=688h+sw+idh+sw+688h;
z=motx+688d+w;


hotx=x+w*2;	//40;
hoty=25;

zd=-688d/2-motx;
zu=688d/2+w;


icx=8; //(x-688d)/2;
icy=12;
icyi=icy-1;
icz=688d+w;

osd=9;
osdi=5.5;
osrz=0.1;

$fn=64;

function dg(a) = sqrt(a*a+a*a);

module nex() {
translate([-sbd8/2,0,0]) {
%translate([-idd/2, 0, 0]) rotate([90,0,0]) cylinder(idh, idd/2, idd/2, true);
%translate([-idd/2, 0, 0]) rotate([90,0,0]) cylinder(idh*2, idi/2, idi/2, true);
%translate([sbd8/2, 0, 0]) rotate([90,0,0]) cylinder(idh, sbd8/2, sbd8/2, true);
for (my=[0,1]) mirror([0,my,0])
%translate([sbd8/2, -idh/2-688h/2-sw, 0]) rotate([90,0,0]) cylinder(688h, 688d/2, 688d/2, true);


translate([osx, y/2+motl/2, -bwax]) {
%translate([0, 0, 0]) cube([motx, motl, motx], true);
%translate([0, -motl/2-motl1/2, 0]) rotate([90,0,0]) cylinder(motl1, motd/2, motd/2, true);
#translate([0, -motl/2-motl1-motvl/2, 0]) rotate([90,0,0]) cylinder(motvl, 5/2, 5/2, true);

for (mz=[0,1]) mirror([0,0,mz])
for (mx=[0,1]) mirror([mx,0,0])
#translate([-motbwo/2,-motl/2-3/2,-motbwo/2]) rotate([90,0,0]) cylinder(3, m25d/2, m25d/2, true);

} // tr

//%translate([sbd8/2, -y/2-sh8h-g2h/2, 0]) rotate([90,0,0]) cylinder(g2h, g2d/2, g2d/2, true);
//%translate([osx, -y/2-sh8h+g1h/2-g1h1, -bwax]) rotate([90,0,0]) cylinder(g1h, g1d/2, g1d/2, true);

%translate([sbd8/2, -y/2+boltl/2-sh8h-g2h, 0]) rotate([90,0,0]) cylinder(boltl, sbd8/2, sbd8/2, true);

#translate([sbd8/2, -y/2-sh8h/2, 0]) rotate([90,0,0]) cylinder(sh8h, sh8d/2, sh8d/2, true);
#translate([sbd8/2, y/2+sh8h/2, 0]) rotate([90,0,0]) cylinder(sh8h, sh8d/2, sh8d/2, true);
#translate([sbd8/2, y/2+sh8h+m8nh/2, 0]) rotate([90,90,0]) cylinder(m8nh, m8nd/2, m8nd/2, $fn=6, true);

} // tr
} // mod nex

module ex() {

difference() {
union() {
translate([0,0,zd+z/2]) cube([x+0.01,y,z], true);
//translate([0,0,zd+w/2]) cube([xx,y,w], true);

for (mx=[0,1]) mirror([mx,0,0])
translate([-motbwo/2, 0, -688d/2-motx/2+motbwo/2]) rotate([90,0,0]) cylinder(y, osd/2, osd/2, true);

// mount hot
for (mx=[0,1]) mirror([mx,0,0])
translate([-hotx/2, 0, zd+w/2]) cube([hotx-x, hoty, w], true);

difference() {
union() {
for (my=[0,1]) mirror([0,my,0])
for (mx=[0,1]) mirror([mx,0,0])
translate([-hotx/2, -hoty/2, zd]) cylinder(m3nh+w, (hotx-x)/2, (hotx-x)/2, $fn=6);
} // un
// big gear cut
translate([0, -y/2-sh8h-g2h/2, 0]) rotate([90,0,0]) cylinder(g2h+4, g2d/2+0.5, g2d/2+0.5, true);
} // df

for(mx=[0,1]) mirror([mx,0,0])
translate([-x/2,0,zd+w]) rotate([0,45,0]) cube([w*2, w, w*2], true);

} // un

// down cut
translate([0,0,zd-w]) mirror([0,0,1]) cube([hotx,y,w*2], true);

// mount otv
//for (mx=[0,1]) mirror([mx,0,0]) {
//translate([-bwx/2, 0, zd+w/2]) cylinder(w+1, m4di/2, m4di/2, true);
//translate([-bwx/2, 0, zd+w]) rotate([0,0,90]) cylinder(m4nh+1, m4ndi/2, m4ndi/2, $fn=6);
//} // for
for (my=[0,1]) mirror([0,my,0])
for (mx=[0,1]) mirror([mx,0,0]) {
translate([-hotx/2, -hoty/2, zd+w+m3nh/2]) cylinder(m3nh+0.1, m3ndi/2, m3ndi/2, $fn=6, true);
translate([-hotx/2, -hoty/2, zd+w/2]) cylinder(w+0.1, m3di/2, m3di/2, true);
} // for



// osn cut
for (my=[0,1]) mirror([0,my,0])
for (mx=[0,1]) mirror([mx,0,0]) {
//translate([-xx/2, -hoty/2-w, zd+w/2]) rotate([0,0,45]) cube([w4,w4,w+1], true);
//translate([-x/2, -hoty/2-w, zd+w/2]) rotate([0,0,45]) cube([w4,w4,w+1], true);
translate([-x/2, 0, zu]) rotate([0,45,0]) cube([w4/2,y+1,w4/2], true);
} // for


// filament otv
translate([-bolt8/2-fw/2, 0, zd-1]) cylinder(z+2, fildi/2, fildi/2);
translate([-bolt8/2-fw/2, 0, zu-1/2]) cylinder(1, fildi/2, fildi/2+1);


// motor otv
translate([0, 0, zd+motx/2]) rotate([0,0,90]) rotate([0,37,0]) teardrop(motdi/2, y+1, 53);
translate([0, y/2-motl1, zd+motx/2]) rotate([90,0,0]) cylinder(1, motdi/2+1, motdi/2, true);
translate([0, y/2-motl1/2, zd+motx/2]) rotate([0,0,90]) rotate([0,37,0]) teardrop(motbd/2, motl1+0.1, 53);
translate([0, y/2, zd+motx/2]) rotate([90,0,0]) cylinder(1, motbd/2+1, motbd/2, true);
translate([0, -y/2-sh8h+g1h2/2, zd+motx/2]) rotate([0,0,90]) rotate([0,37,0]) teardrop(g1d/2+2, g1h2+0.6, 53);
translate([0, -y/2, zd+motx/2]) rotate([90,0,0]) cylinder(1, g1d/2+2, g1d/2+2+1, true);
translate([0, -y/2-sh8h+g1h2+0.6/2, zd+motx/2]) rotate([90,0,0]) cylinder(1, motdi/2, motdi/2+1, true);

translate([0, 0, zd+motx/2]) {
for (mx=[0,1]) mirror([mx,0,0]) {
translate([-motbwo/2, 0, -motbwo/2]) rotate([0,0,90]) rotate([0,37,0]) teardrop(motbl/2, y+1, 53);
translate([-motbwo/2, y/2, -motbwo/2]) rotate([90,0,0]) cylinder(1, motbl/2+1, motbl/2, true);
translate([-motbwo/2, 0, motbwo/2]) rotate([0,0,90]) rotate([0,37,0]) teardrop(motbl/2, y+1, 53);
translate([-motbwo/2, y/2, motbwo/2]) rotate([90,0,0]) cylinder(1, motbl/2+1, motbl/2, true);

translate([-motbwo/2, -y/2, -motbwo/2]) rotate([0,0,90]) rotate([0,37,0]) teardrop(motsh/2, (y-m25l)*2, 53);
} // for
translate([motbwo/2, -y/2, motbwo/2]) rotate([0,0,90]) rotate([0,37,0]) teardrop(motsh/2, (y-m25l)*2, 53);
translate([-motbwo/2, -y/2, motbwo/2]) rotate([0,0,90]) rotate([0,37,0]) teardrop(motsh/2, (y-m25l1)*2, 53);
} // tr

translate([x/2, -y/2+g1h2/2-0.6, zd+motx/2]) rotate([0,0,0]) rotate([0,37,0]) teardrop(4.5/2, x, 53);


// hobbed otv
translate([0,0,0]) rotate([0,0,90]) rotate([0,37,0]) teardrop(sbd8/2+0.5, y+1, 53);
//translate([0,y/2-688h,0]) rotate([0,0,90]) rotate([0,37,0]) teardrop((sbd10+0.5)/2, 0.6, 53);
translate([0,y/2-688h,0]) rotate([90,0,0]) cylinder(0.6, (sbd10+0.5)/2+1,(sbd10+0.5)/2, true);
translate([0,-y/2+688h,0]) rotate([90,0,0]) cylinder(0.6, (sbd10+0.5)/2,(sbd10+0.5)/2+1, true);
for (my=[0,1]) mirror([0,my,0]) {
translate([0,-y/2+688h/2,0]) rotate([0,0,90]) rotate([0,37,0]) teardrop(688dih/2, 688h+0.1, 53);
translate([0,-y/2,0]) rotate([90,0,0]) cylinder(1, 688dih/2, 688dih/2+1, true);
} // for

// idler cut
//translate([0,y/4,0])
hull() {
translate([-x/2-icx/2, 0, 688d/2-(bolt8/2+idd/2+fw-688d/2) ]) rotate([90,0,0]) cylinder(icy, (bolt8/2+idd/2+fw-688d/2), (bolt8/2+idd/2+fw-688d/2), true);
translate([-bolt8/2-idd/2-fw, 0, 0]) rotate([90,0,0]) cylinder(icy, (bolt8/2+idd/2+fw-688d/2), (bolt8/2+idd/2+fw-688d/2), true);

translate([-motbwo/2, 0, -688d/2-motx/2+motbwo/2]) rotate([90,0,0]) cylinder(icy, (bolt8/2+idd/2+fw-688d/2), (bolt8/2+idd/2+fw-688d/2), true);
translate([-x/2-icx/2, 0, -w6/2]) rotate([90,0,0]) cylinder(icy, icx/2, icx/2, true);
} // hl

for (r=[0:5:40])
translate([-motbwo/2,0,motbwo/2-motx/2-688d/2])
rotate([0,-r,0])
translate([motbwo/2,0,-motbwo/2+motx/2+688d/2])
translate([-bolt8/2-idd/2, 0, 0]) rotate([90,0,0]) cylinder(idh+0.5, iddi/2, iddi/2, true);

translate([-bolt8/2-idd/2, 0, 0]) rotate([90,0,0]) cylinder(idh+lay*6, idi/2+0.7, idi/2+0.7, true);
translate([-bolt8/2-idd/2, -(idh+0.5)/2, iddi/2]) mirror([1,0,0]) mirror([0,0,1]) rotate([0,0,0]) cube([w*3, idh+0.5, w]);
translate([-motbwo/2, 0, -688d/2-motx/2+motbwo/2]) rotate([90,0,0]) cylinder(icy, osd/2+0.5, osd/2+0.5, true);
translate([-motbwo/2, 0, -688d/2-motx/2+motbwo/2]) rotate([0,-30,0]) translate([-(osd+1)/2,0,0]) cube([osd+1, icy, osd+1], true);


// bolts idler
translate([-x/2-sbd8/2, 0, zu-m3nd/2]) rotate([0,37,0]) teardrop(m3dih/2, x, 53);
translate([-x/2, 0, zu-m3nd/2]) rotate([0,90,0]) cylinder(1, m3dih/2+1, m3dih/2, true);
for (i=[0:2])
translate([-sbd8/2-fw-fildi-1, 0, zu-m3nd/2+i]) rotate([0,90,0]) cylinder(m3nh, m3ndih/2, m3ndih/2, $fn=6, true);




} // df
} // mod ex






module idler1() {
difference() {
union() {
hull() {
translate([-x/2-icx/2, 0, zu]) rotate([90,0,0]) cylinder(icyi, icx/2, icx/2, true);
translate([-x/2-icx/2, 0, -w6/2]) rotate([90,0,0]) cylinder(icyi, icx/2, icx/2, true);
} // hl
hull() {
translate([-motbwo/2, 0, -688d/2-motx/2+motbwo/2]) rotate([90,0,0]) cylinder(icyi, osd/2, osd/2, true);
translate([-x/2-icx/2, 0, -w6/2]) rotate([90,0,0]) cylinder(icyi, icx/2, icx/2, true);
} // hl

hull() {
translate([-x/2-icx/2, 0, 688d/2-(bolt8/2+idd/2+fw-688d/2) ]) rotate([90,0,0]) cylinder(icy-1, (bolt8/2+idd/2+fw-688d/2), (bolt8/2+idd/2+fw-688d/2), true);
translate([-bolt8/2-idd/2-fw, 0, 0]) rotate([90,0,0]) cylinder(icy-1, (bolt8/2+idd/2+fw-688d/2), (bolt8/2+idd/2+fw-688d/2), true);
} // hl

hull() {
translate([-bolt8/2-idd/2-fw, 0, 0]) rotate([90,0,0]) cylinder(icy-1, (bolt8/2+idd/2+fw-688d/2), (bolt8/2+idd/2+fw-688d/2), true);
translate([-motbwo/2, 0, -688d/2-motx/2+motbwo/2]) rotate([90,0,0]) cylinder(icyi, (bolt8/2+idd/2+fw-688d/2), (bolt8/2+idd/2+fw-688d/2), true);
} //hl

//%translate([-bolt8/2-idd/2-fw, 0, 0]) rotate([0,30,0]) translate([-w,0,0]) cube([w*2, icyi, (bolt8/2+idd/2+fw-688d/2)*2], true);
//%translate([-bolt8/2-idd/2-fw, 0, 0]) rotate([0,-60,0]) translate([-w,0,0]) cube([w*2, icyi, (bolt8/2+idd/2+fw-688d/2)*2], true);
//%translate([-bolt8/2-idd/2-fw, 0, 0]) rotate([90,0,0]) cylinder(icy-1, 6/2, 6/2, true);
} // un


//translate([-x/2-icx/2-icx, 0, 0]) cube([icx, icyi+1, w*3], true);

translate([-motbwo/2, 0, -688d/2-motx/2+motbwo/2]) rotate([90,0,0]) cylinder(icy+1, osdi/2+osrz/2, osdi/2+osrz/2, true);
for (my=[0,1]) mirror([0,my,0])
translate([-motbwo/2, -icyi/2, -688d/2-motx/2+motbwo/2]) rotate([90,0,0]) cylinder(1, osdi/2+osrz/2, osdi/2+osrz/2+1, true);

%translate([0, 0, 0]) rotate([90,0,0]) cylinder(idh+0.5, bolt8/2, bolt8/2, true);
%translate([-bolt8/2-idd/2-fw, 0, 0]) rotate([90,0,0]) cylinder(idh, idd/2, idd/2, true);
%translate([0, y/2-688h/2, 0]) rotate([90,0,0]) cylinder(688h, 688d/2, 688d/2, true);
%translate([0, -y/2+688h/2, 0]) rotate([90,0,0]) cylinder(688h, 688d/2, 688d/2, true);

translate([-bolt8/2-idd/2-fw, 0, 0]) rotate([90,0,0]) cylinder(idh+lay*4, idd/2+1, idd/2+1, true);

// bolts idler
translate([-bolt8/2-idd/2-fw, 0, 0]) rotate([90,0,0]) cylinder(icy+1, m25d/2, m25d/2, true);
translate([-bolt8/2-idd/2-fw, -icy/2, 0]) rotate([90,0,0]) cylinder(4, (m25shd-0.5)/2, (m25shd-0.5)/2, true);
translate([-x/2-icx, 0, zu-m3nd/2]) rotate([90,0,0])rotate([0,37,0]) teardrop(m3dih/2+0.5, x+1, 53);
translate([-x/2-icx, 0, zu-m3nd/2]) rotate([0,90,0]) cylinder(1, m3dih/2+0.5+1, m3dih/2+0.5, true);
translate([-x/2, 0, zu-m3nd/2]) rotate([0,90,0]) cylinder(1, m3dih/2+0.5, m3dih/2+0.5+1, true);

%translate([-x/2-icx, 0, zu-m3nd/2]) rotate([90,0,0])rotate([0,37,0]) teardrop(m3shd/2, 1, 53);


} // df


} // mod idler1



module ivtu() {
translate([-motbwo/2, 0, -688d/2-motx/2+motbwo/2]) rotate([90,0,0,0])
difference() {
cylinder(icy, osdi/2-osrz/2, osdi/2-osrz/2, true);
cylinder(icy+1, motbl/2, motbl/2, true);
} // df
} // mod ivtu



module ivtu1() {
difference() {
union() {
translate([-bolt8/2-idd/2-fw, idh/2+lay*2, 0]) rotate([90,0,0]) cylinder(lay*2, idi/2+0.5, idi/2+0.5);
translate([-bolt8/2-idd/2-fw, idh/2, 0]) rotate([90,0,0]) cylinder(idh/2, idi/2, idi/2);
} // un
translate([-bolt8/2-idd/2-fw, 0, 0]) rotate([90,0,0]) cylinder(icy+1, m25di/2, m25di/2, true);
} // df
}  //mod ivtu1

module gears() {
translate([0, -y/2-sh8h-g1h1, zd+motx/2]) rotate([-90,0,0]) import("gears917s.stl");
translate([0, -y/2-sh8h, 0]) rotate([90,0,0]) import("gears917b.stl");
} // mod gears

module shaib() {
difference() {
	cylinder(sh8h, (sbd8+4)/2, (sbd8+2)/2, true);
	cylinder(sh8h+1, sbd8/2, sbd8/2, true);
} // df
} // mod shaib


translate([0,0,-zd]) {
nex();
ex();
ivtu();
//translate([-motbwo/2,0,motbwo/2-motx/2-688d/2])
//rotate([0,-10,0])
//translate([motbwo/2,0,-motbwo/2+motx/2+688d/2])
idler1();
//ivtu1();
//translate([10,0,0]) ivtu1();
//mirror([0,1,0])ivtu1();
gears();
//shaib();
//translate([15,0,0]) shaib();


} // tr