// Table Parameters
tableWidth = 100;         // Width of the table
tableLength = 150;        // Length of the table
tableHeight = 75;         // Height of the table
legThickness = 5;         // Thickness of the table legs

// Generate Table
module table() {
    difference() {
        cube([tableWidth, tableLength, tableHeight], center=true);  // Table surface
        union() {
            translate([(tableWidth/2 - legThickness/2), (tableLength/2 - legThickness/2), 0])
            cube([legThickness, legThickness, tableHeight], center=true);  // Front left leg
            translate([-(tableWidth/2 - legThickness/2), (tableLength/2 - legThickness/2), 0])
            cube([legThickness, legThickness, tableHeight], center=true);  // Front right leg
            translate([(tableWidth/2 - legThickness/2), -(tableLength/2 - legThickness/2), 0])
            cube([legThickness, legThickness, tableHeight], center=true);  // Back left leg
            translate([-(tableWidth/2 - legThickness/2), -(tableLength/2 - legThickness/2), 0])
            cube([legThickness, legThickness, tableHeight], center=true);  // Back right leg
        }
    }
}

// Render Table
table();
