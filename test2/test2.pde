float rotY = 0;
float a = 0;
float xpos, ypos;
int xdirection = 1;
int ydirection = 1;
float xspeed = 2.2;
float yspeed = 2.2;
int backColor = 1;
int colorDirection = 1;
void setup() {
  size(500, 500, P3D);
  smooth();
  xpos = 250;
  ypos = 0;
  textSize(32);
  fill(255, 153, 255, 204);


}

void draw() {
  drawAbox();
  drawAsphere();
}

void drawAbox() {
  
  translate(xpos, ypos, map(noise(a), 0, 1, -1000, 400));
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
}

void drawAsphere() {
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
  translate(xpos, ypos, map(noise(a), 0, 1, -1000, 400));
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
  sphere(75);
}
