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
  fullScreen(P3D);
  smooth();
  xpos = width/2;
  ypos = height/2;
  frameRate(30);
}

void draw() {
  setBackground();
  //drawAsphere();
  drawAsphere();
  drawAbox();
  drawAbox();
  drawAbox();
  drawAbox();
  drawAbox();

}

void drawAbox() {
  float rand = random(7);
  int randInt = Math.round(rand);
  switch (randInt) {
    case 0:
      fill(255, 230, 0, 0);
      break;
    case 1:
     fill(255, 255, 153, 102);
     break;
    case 2:
     fill(255, 255, 255, 153);
     break;
    case 3:
     fill(255, 255, 255, 153);
     break;
    case 4:
     fill(255, 0, 102, 255);
     break;
    case 5:
     fill(255, 153, 51, 255);
     break;
    case 6:
     fill(255, 255, 51, 204);
     break;
  }
  translate(xpos, ypos, map(noise(a), 0, 1, -1000, -450));
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);
  if (xpos > width || xpos < width) {
    xdirection *= -1;
  }
  if (ypos > height || ypos < height) {
    ydirection *= -1;
  }
  a += 0.01;
  rotY += 0.01;
  rotateY(-rotY);
  rotateX(-rotY);
  box(75);
 //<>//
}

void drawAsphere() {
  fill(255, 153, 255, 204);
  translate(xpos, ypos, map(noise(a), 0, 1, -400, 400));
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);
  if (xpos > width || xpos < width) {
    xdirection *= -1;
  }
  if (ypos > height || ypos < height) {
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
     //backColor -= 1;
   }
    else if (colorDirectionS == -1){
     colorDirectionB *= -1;
     backColor += 1;
    }
  }
} //<>//
