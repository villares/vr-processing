
Caixa caixinha0, caixinha1;

Caixa[] caixas; 


void setup() {
  size(300, 300, P3D);
  caixinha0 = new Caixa(100, 0, 0);
  caixinha1 = new Caixa(0, 100, 0);
  caixas = new Caixa[500];
  for (int i=0; i < caixas.length; i++) {
    caixas[i] = new Caixa(0, 0, 0);
  }
}
void draw() {
  lights();
  background(255);
  translate(width / 2, height / 2);
  rotateX(QUARTER_PI);
  caixinha0.display();
  caixinha1.display();
  caixinha0.move();
  caixinha1.move();
  for (int i=0; i < caixas.length; i++) {
    caixas[i].display();
    caixas[i].move();
  }

  //print(caixinha0.x);
}
