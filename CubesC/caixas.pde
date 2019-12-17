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
