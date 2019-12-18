int seed;

PShape objL;

void setup() {
  size(800, 600, P3D); 
  frameRate(10);
  seed = 26876; //novaSemente();
  objL = loadShape("LucF6.obj");
}

void draw() {
  lights();
  background(0);
  randomSeed(seed);
  translate(width/2, height/2, 300);
  //scale(mouseY / 10.);
  rotateZ(HALF_PI);
  rotateZ(radians(mouseX));
  //translate(-width/2, -height/2);
  //for (int y=30; y<height; y+=30) {
  //  for (int x=30; x<width; x+=30) {
  int pontos = 36;
  int raio = 500;
  float passo = TWO_PI / pontos;
  for (int z = -600; z <= 600; z = z + 30) {
    for (int i=0; i < pontos; i++) { 
      float x = 0 + raio * sin(passo * i);
      float y = 0 + raio * cos(passo * i);  
      float tamanho = random(5, 25);
      fill(corSorteada());
      //caixa(x, y, z, tamanho, -passo * i);
    }
  }
  //scale(20);
  shapeMode(CENTER);
  shape(objL);
  //  }
  //}
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
