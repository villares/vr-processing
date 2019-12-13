color cor;

void setup() {
  size(600, 500, P3D);
  cor = corSorteada();
}

void draw() {
  fill(cor);  
  translate(width/2, height/2); // muda o 0, 0
  // gira o sistema de cordenadas
  rotateX(radians(mouseX)); 
  background(0, 100, 200);
  noStroke();
  caixa(-120, 0, -120, 60);
  caixa(120, 120, 0, 60);
}

void keyPressed(){
 cor = corSorteada(); 
}

color corSorteada(){
  return color(random(256), random(256), random(256));
}
