// Flower Parameters
petalCount = 8;          // Number of petals
petalLength = 40;        // Length of each petal
petalWidth = 10;         // Width of each petal
petalRotation = 45;      // Rotation angle for the petals
centerRadius = 8;        // Radius of the center of the flower

// Generate Petal Shape
module petal() {
    rotate([0, 0, petalRotation])
    translate([0, petalLength/2, 0])
    scale([1, 2, 1])
    rotate([0, 0, 180])
    translate([0, -petalLength/2, 0])
    linear_extrude(height=petalLength)
    polygon(points=[[0, 0], [petalWidth/2, petalLength], [0, petalLength*2], [-petalWidth/2, petalLength]], paths=[[0, 1, 2, 3]]);
}

// Generate Flower
module flower() {
    for (i = [0:petalCount-1]) {
        rotate([0, 0, 360*i/petalCount])
        petal();
    }
    cylinder(h=petalLength, r=centerRadius, $fn=6); // Flower center
}

// Render Flower
flower();
