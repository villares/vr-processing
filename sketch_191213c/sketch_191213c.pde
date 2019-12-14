

void setup() {
  size(600, 500);
}

void draw() {
  background(0);
  poliRegular(200, 250, mouseX, int(mouseY / 20));
  poliRegular(300, 250, mouseX, 9);
  poliRegular(400, 250, mouseX, 3);
}

void poliRegular(float xo, float yo, 
  float raio, int pontos) {
  float a = TWO_PI / pontos;
  beginShape();
  for (int i=0; i < pontos; i++) { 
    float x = xo + raio * sin(a * i);
    float y = yo + raio * cos(a * i);
    vertex(x, y);
  }
  endShape(CLOSE);
}
