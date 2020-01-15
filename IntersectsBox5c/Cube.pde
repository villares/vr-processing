
class Cube {

  // Properties
  int w, h, d;
  int shiftX, shiftY, shiftZ;
  PShape cubeGeom;
  color cor;
  
  // Constructor
  Cube(int w, int shiftX, int shiftY, int shiftZ) {
    this.w = w;
    this.shiftX = shiftX;
    this.shiftY = shiftY;
    this.shiftZ = shiftZ;
    this.cor = color(random(256), random(256),random(256));
    this.cubeGeom = createCube(this.w, this.cor);
  }
  void drawCube() {
    pushMatrix();
    translate(shiftX, shiftY, shiftZ);
    float x = screenX(0, 0, 0);
    float y = screenX(0, 0, 0);
    if (intersectsBox(this.w, 0, 0)) {
      destroy(cubeGeom, 1.5);
    }
    rotateY(radians(shiftX));
    rotateX(radians(shiftY));
    rotateZ(radians(shiftZ));
    shape(cubeGeom);
    popMatrix();
    // Add some rotation to each box for pizazz.
  }
  void reset() {
    this.cubeGeom = createCube(this.w, this.cor);
  }
}


PShape createCube(float cubeSize, color c) {
  PShape cube = createShape(GROUP);  

  PShape face;

  // Create all faces at front position
  for (int i = 0; i < 6; i++) {
    face = createShape();
    createFaceWithHole(face, cubeSize, c);
    cube.addChild(face);
  }
  
  
  // Rotate all the faces to their positions

  // Front face - already correct
  face = cube.getChild(0);

  // Back face
  face = cube.getChild(1);
  face.rotateY(radians(180));

  // Right face
  face = cube.getChild(2);
  face.rotateY(radians(90));

  // Left face
  face = cube.getChild(3);
  face.rotateY(radians(-90));

  // Top face
  face = cube.getChild(4);
  face.rotateX(radians(90));

  // Bottom face
  face = cube.getChild(5);
  face.rotateX(radians(-90));

  return cube;
}

void createFaceWithHole(PShape face, float cubeSize, color c) {
  float circleRad = cubeSize * .4;
  int circleRes = 6;
  face.beginShape(POLYGON);
  face.noStroke(); //(255, 0, 0);
  face.fill(c);
  // Draw main shape Clockwise
  face.vertex(-cubeSize/2, -cubeSize/2, +cubeSize/2);
  face.vertex(+cubeSize/2, -cubeSize/2, +cubeSize/2);
  face.vertex(+cubeSize/2, +cubeSize/2, +cubeSize/2);
  face.vertex(-cubeSize / 2, +cubeSize / 2, +cubeSize / 2);

  // Draw contour (hole) Counter-Clockwise
  face.beginContour();
  for (int i = 0; i < circleRes; i++) {
    float angle = TWO_PI * i / circleRes;
    float x = circleRad * sin(angle);
    float y = circleRad * cos(angle);
    float z = +cubeSize/2;
    face.vertex(x, y, z);
  }
  face.endContour();

  face.endShape(CLOSE);
}
