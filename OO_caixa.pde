
Caixa caixinha0, caixinha1;

void setup() {
  size(300, 300, P3D);
  caixinha0 = new Caixa(100, 0, 0);
  caixinha1 = new Caixa(0, 100, 0);
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
  //print(caixinha0.x);
}

class Caixa {
  float x, y, z, w, h, d, r;
  color cor;
  float vx, vy, vz;

  Caixa(float x_, float y_, float z_) {
    x = x_;
    y = y_;
    z = z_;
    w = 80;
    h = 40;
    d = 20;
    vx = random(-5, 5);
    vy = random(-5, 5);
    vz = random(-5, 5);
    cor = color(random(256), random(256), random(256));
    r = 0; // rotação
  }
  void display() {
    fill(cor);
    caixa(x, y, z, w, h, d, r);
  }
  void move() {
    r += 0.03;
    x = x + vx;
    y = y + vy;
    z = z + vz;
    if (x > width / 2 || x < -width / 2) {
      vx = -vx;
    }
    if (y > height / 2 || y < -height / 2) {
      vy = -vy;
    }
    if (z > height / 2 || z < -height / 2) {
      vz = -vz;
    }
  }
}



void caixa(float x, float y, float z, 
  float w, float h, float d, float r) {
  pushMatrix();
  translate(x, y, z);
  rotateZ(r);
  box(w, h, d);
  popMatrix();
}
