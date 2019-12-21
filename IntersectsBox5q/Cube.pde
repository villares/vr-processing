
class Cube {

  // Properties
  int w, counter;
  int shiftX, shiftY, shiftZ;
  PShape cubeGeom;

  // Constructor
  Cube(int w, int shiftX, int shiftY, int shiftZ) {
    this.w = w;
    this.counter = 0;
    this.shiftX = shiftX;
    this.shiftY = shiftY;
    this.shiftZ = shiftZ;
    this.cubeGeom = createCube(w);
  }
  void drawCube() {
    pushMatrix();
    translate(shiftX, shiftY, shiftZ);
    if (intersectsBox(50, 0, 0)) {
      destroy(cubeGeom, 1);
      counter += 10;
    } else {
      if (counter >= 0){
      counter--; 
      } else {
       cubeGeom = createCube(w); 
       counter = 0;
      }
    }
    rotateY(radians(shiftX));
    rotateX(radians(shiftY));
    rotateZ(radians(shiftZ));
    shape(cubeGeom);
    popMatrix();
    // Add some rotation to each box for pizazz.
  }
}
