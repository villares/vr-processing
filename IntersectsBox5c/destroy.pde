void destroy(PShape objL, float noiseMag) {
  PVector pos = null;
  for (int i = 0; i < objL.getChildCount(); i++) {
    PShape face = objL.getChild(i);
    for (int j = 0; j < face.getVertexCount(); j++) {
      pos = face.getVertex(j, pos);
      pos.x += random(-noiseMag/2, +noiseMag/2);
      pos.y += random(-noiseMag/2, +noiseMag/2);
      pos.z += random(-noiseMag/2, +noiseMag/2);
      face.setVertex(j, pos.x, pos.y, pos.z);
    }
  }
}
