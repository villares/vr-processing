void caixa(float x, float y, float z, 
  float w, float h, float d) {
  pushMatrix();
  translate(x, y, z);
  box(w, h, d);
  popMatrix();
}

void caixa(float x, float y, float z,
           float lado) {
  caixa(x, y, z, lado, lado, lado);
}
