// Versão 15/01/2020 no PPD Nestor Pestana

import processing.vr.*;

VRCamera cam;
float rotSpeed = 0.3; 
// Used for oveall rotation
float angle = 0;
// Cube count-lower/raise to test performance
int limit = 50;
// Array for all cubes
Cube[] cubes = new Cube[limit];

long tempoIni = millis(); 
int intervalo = 25000;

void setup() {
  //size(600, 600, P3D);
  fullScreen(VR);
  cameraUp();
  noStroke();
  cam = new VRCamera(this);
  // Instantiate cubes, passing in random vals for size and postion
  for (int i = 0; i < cubes.length; i++) {
    cubes[i] = new Cube(int(random(20, 50)), 
      int(random(-140, 140)), 
      int(random(-140, 140)),
      int(random(-140, 140)));
  }
}

void draw() {
  background(0); 
  fill(200);
  // Set up some different colored lights
  pointLight(102, 102, 155, 65, 60, 100); 
  pointLight(200, 200, 200, -65, -60, -150);
  // Raise overall light in scene 
  ambientLight(70, 70, 10); 
  cam.setPosition(0, 0, 10);
  // Rotate around y and x axes
  rotateY(radians(angle));
  rotateX(radians(angle));

  // Draw cubes
  for (int i = 0; i < cubes.length; i++) {
    cubes[i].drawCube();
  }

  // Used in rotate function calls above
  angle += 0.02;
  // mira
  cam.sticky();
  stroke(255, 100);
  strokeWeight(50);
  point(0, 0, 100);
  cam.noSticky();

  if (millis() - tempoIni > intervalo) {
    tempoIni = millis();
    for (int i = 0; i < cubes.length; i++) {
      cubes[i].reset();
    }
  }
}
