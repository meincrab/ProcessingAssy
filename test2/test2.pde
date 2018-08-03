float rotY = 0;
float a = 0;
float xpos, ypos;
int xdirection = 1;
int ydirection = 1;
float xspeed = 2.2;
float yspeed = 2.2;
int backColor = 1;
int colorDirectionS = 1;
int colorDirectionB = 1;

void setup() {
  size(500, 500, P3D);
  smooth();
  xpos = 250;
  ypos = 0;
  frameRate(60);
}

void draw() {
  setBackground();
  drawAbox();
  drawAsphere();
}

void drawAbox() {
  fill(255, 153, 255, 204);
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
 //<>//
}

void drawAsphere() {
  fill(255, 153, 255, 204);
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
  
} //<>//

void setBackground() {
   if (backColor <= 254 && backColor >= 0 && colorDirectionS== 1) {
    background(backColor);
    backColor += 1;
   }
   else if (backColor <= 254 && backColor >= 0 && colorDirectionS== -1){
    background(backColor);
    backColor -= 1;
  }
  else if (backColor >= 255 || backColor <= 0) {
   if (colorDirectionS == 1) {
     colorDirectionS *= -1;
     backColor -= 1;
   }
    else if (colorDirectionS == -1){
     colorDirectionB *= -1;
     backColor += 1;
    }
  }
}
