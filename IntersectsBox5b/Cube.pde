
class Cube {

  // Properties
  int w, h, d;
  int shiftX, shiftY, shiftZ;
  PShape cubeGeom;

  // Constructor
  Cube(int w, int shiftX, int shiftY, int shiftZ) {
    this.w = w;
    this.shiftX = shiftX;
    this.shiftY = shiftY;
    this.shiftZ = shiftZ;
    this.cubeGeom = createCube(w);
  }
  void drawCube() {
    pushMatrix();
    translate(shiftX, shiftY, shiftZ);
    float x = screenX(0, 0, 0);
    float y = screenX(0, 0, 0);
    if (intersectsBox(100, 0, 0)) {
      destroy(cubeGeom, 0.5);
    }
    rotateY(radians(shiftX));
    rotateX(radians(shiftY));
    rotateZ(radians(shiftZ));
    shape(cubeGeom);
    popMatrix();
    // Add some rotation to each box for pizazz.
  }
}
