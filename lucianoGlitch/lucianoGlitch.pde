PImage imagemEstragada;

void setup() {
  fullScreen();
  imageMode(CENTER);
  noLoop();
}

void draw() {
  byte[] dados=loadBytes("Luc.jpg");    // carrega a imagem original
  int loc = int(random(1, dados.length));  // sorteia uma posição no array
  dados[loc] = (byte)random(255);          // sorteia um valor de byte e substitui
  saveBytes("imagemEstragada.jpg", dados);         // salva um novo arquivo modificado
  imagemEstragada = loadImage("imagemEstragada.jpg");        // carrega a imagem modificada
  image (imagemEstragada, width/2, height/2);
}

void keyPressed(){
  redraw();
}
