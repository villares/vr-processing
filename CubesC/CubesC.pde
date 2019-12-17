import processing.vr.*;

int seed;

void setup() {
  fullScreen(VR);
  seed = 26876;
}

void draw() {
  lights();
  background(0);
  randomSeed(seed);
  translate(width/2, height/2);
  rotateX(HALF_PI);
  //rotateZ(radians(mouseX));
  int pontos = 36;
  int raio = 500;
  float passo = TWO_PI / pontos;
  for (int z = -600; z <= 600; z = z + 30) {
    for (int i=0; i < pontos; i++) { 
      float x = 0 + raio * sin(passo * i);
      float y = 0 + raio * cos(passo * i);  
      float tamanho = random(5, 25);
      fill(corSorteada());
      caixa(x, y, z, tamanho, -passo * i);
    }
  }
}
