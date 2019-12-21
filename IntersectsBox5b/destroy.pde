void destroy(PShape objL, float noiseMag) {
  PVector pos = null;
  for (int i = 0; i < objL.getChildCount(); i++) {
    PShape face = objL.getChild(i);
    for (int j = 0; j < face.getVertexCount(); j++) {
      pos = face.getVertex(j, pos);
      pos.x += random(-noiseMag/2, +noiseMag/2);
      pos.y += random(-noiseMag/2, +noiseMag/2);
      pos.z += random(-noiseMag/2, +noiseMag/2);
      face.setVertex(j, pos.x, pos.y, pos.z);
    }
  }
}

PShape createCube(float cubeSize) {
  PShape cube = createShape(GROUP);  

  PShape face;

  // Create all faces at front position
  for (int i = 0; i < 6; i++) {
    face = createShape();
    createFaceWithHole(face, cubeSize);
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

void createFaceWithHole(PShape face, float cubeSize) {
  float circleRad = cubeSize * .5;
  int circleRes = 4;
  face.beginShape(POLYGON);
  //face.stroke(255, 0, 0);
  face.fill(255);

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
