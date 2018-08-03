int xPos = 100;

void setup() {
  size(450, 360, P3D);
}

void draw() {
  background(100);
  
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 5);
  polygon(xPos, 0, 82, 3);
  popMatrix();
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
