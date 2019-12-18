int seed;
float noiseMag = 0.005;
PShape objL;

void setup() {
  size(800, 600, P3D); 
  frameRate(10);
  seed = 26876; //novaSemente();
  objL = loadShape("LucF6.obj");
  //frameRate(10);
}

void draw() {
  //lights();
  // Set up some different colored lights
  pointLight(51, 102, 255, 650, 60, 100); 
  pointLight(200, 40, 60, -650, -60, -150);

  // Raise overall light in scene 
  ambientLight(255, 200, 200); 
  
  background(0);
  randomSeed(seed);
  translate(width/2 + 220, 300, 300);
  //scale(mouseY / 10.);
  //rotateX(HALF_PI);
  rotateZ(PI);
  rotateZ(0);
  scale(30);
  //shapeMode(CENTER);
  shape(objL);
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

void keyPressed() {
  if (key == ' ') {
    seed = novaSemente();
  }
}

int novaSemente() {
  int s = int(random(1000000));
  println("seed: " + s);
  return s;
}

color corSorteada() {
  return color(random(256), random(256), random(256));
}

void caixa(float x, float y, float z, 
  float w, float h, float d, float r) {
  pushMatrix();
  translate(x, y, z);
  rotateZ(r);
  box(w, h, d);
  popMatrix();
}

void caixa(float x, float y, float z, 
  float lado, float r) {
  caixa(x, y, z, lado, lado, lado, r);
}
