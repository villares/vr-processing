class Caixa {
  float x, y, z, w, h, d, r;
  color cor;
  float vx, vy, vz;

  Caixa(float x_, float y_, float z_) {
    x = x_;
    y = y_;
    z = z_;
    w = 5;
    h = 10;
    d = 20;
    vx = random(-5, 5);
    vy = random(-5, 5);
    vz = random(-5, 5);
    cor = color(random(256), random(256), random(256));
    r = random(radians(360)); // rotação
  }
  void display() {
    fill(cor);
    float wf, hf, df;
    float x2d = screenX(x, y, z);
    float y2d = screenY(x, y, z);

    if (dist(mouseX, mouseY, x2d, y2d) < 100) {
      //wf = 100;
      //hf = 200;
      //df = 150;
      fill(255);
      stroke(255, 0, 0);
    } else {
      stroke(0);
    //  wf = w;
    //  hf = h;
    //  df = d;
    }
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
