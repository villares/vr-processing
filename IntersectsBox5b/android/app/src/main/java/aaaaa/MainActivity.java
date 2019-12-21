package aaaaa;

import android.os.Bundle;

import processing.vr.VRActivity;
import processing.core.PApplet;

public class MainActivity extends VRActivity {
  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    PApplet sketch = new IntersectsBox2();
    
    setSketch(sketch);
  }
}
