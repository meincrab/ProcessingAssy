float rotY = 0;
float a = 0;
float xpos, ypos;
int xdirection = 1;
int ydirection = 1;
int xspeed = 2;
int yspeed = 2;
int backColor = 1;
int colorDirection = 1;
void setup() {
  size(500, 500, P3D);
  smooth();
  xpos = width/2;
  ypos = width/2;
  frameRate(60);
}

void draw() {
  if (backColor <= 254 && backColor >= 0 && colorDirection == 1) {
    background(backColor);
    backColor += 1;
  }
  else if (backColor <= 254 && backColor >= 0 && colorDirection == -1){
    background(backColor);
    backColor -= 1;
  }
  else if (backColor >= 255 || backColor <= 0) {
    colorDirection *= -1;
  }
  translate(xpos, ypos, map(noise(a), 0, 1, -1900, 300));
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);
  if (xpos > 500 || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > 500 || ypos < 0) {
    ydirection *= -1;
  }
  a += 0.01;
  rotY += 0.01;
  rotateY(rotY);
  rotateX(rotY);
  box(75);
}
