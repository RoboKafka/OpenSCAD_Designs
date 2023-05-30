// Turbine Fan Parameters
$fa = 0.5;  // Rendering accuracy for circles
$fs = 2;    // Rendering accuracy for curved surfaces

// Turbine Fan Dimensions
bladeCount = 6;           // Number of blades
bladeLength = 50;         // Length of each blade
bladeWidth = 10;          // Width of each blade
hubRadius = 15;           // Radius of the central hub
hubHeight = 20;           // Height of the central hub

// Blade Parameters
twistAngle = 45;          // Angle of twist for each blade
twistStart = 20;          // Starting point of the blade twist

// Generate Blades
module blade() {
    rotate([0, 0, twistStart])
    rotate([0, twistAngle, 0])
    translate([0, 0, -bladeWidth/2])
    cube([bladeLength, bladeWidth, bladeWidth], center=true);
}

// Generate Turbine Fan
module turbineFan() {
    union() {
        for (i = [0:bladeCount-1]) {
            rotate([0, 0, 360*i/bladeCount])
            blade();
        }
        cylinder(h=hubHeight, r=hubRadius, $fn=6); // Central hub
    }
}

// Render Turbine Fan
turbineFan();
