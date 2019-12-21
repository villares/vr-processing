package aaaaa;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.vr.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class IntersectsBox2 extends PApplet {



VRCamera cam;
float rotSpeed = 0.3f; 
float rotAngle = 0;

public void setup() {
  
  cameraUp();
  cam = new VRCamera(this);
}

public void draw() {
  background(200, 0, 150);

  cam.setPosition(0, 0, 200);
  push();
  rotateZ(radians(rotAngle));
  translate(100, 0, 0);
  fill(255, 0, 0);
  if (intersectsBox(50, 0, 0)) {
    rotAngle += rotSpeed;
    fill(0, 0, 255);
  }
  box(50);
  pop();
}
  public void settings() {  fullScreen(VR); }
}
