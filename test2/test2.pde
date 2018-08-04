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
  background(0, 255, 0);
}

void draw() {
  lights();
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
  randomColor(0,6);
  translate(xpos, ypos, map(noise(a), 0, 1, -1000, -450));
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);
  if (xpos > width || xpos < width) {
    xdirection *= -1;
  }
  if (ypos > height || ypos < height) {
    ydirection *= -1;
  }
  a += 0.001;
  rotY += 0.01;
  rotateY(-rotY);
  rotateX(-rotY);
  box(75);
 //<>//
}

void drawAsphere() {
  randomColor(7,8);
  //noStroke();
  translate(xpos, ypos, map(noise(a), 0, 1, -400, 1000));
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

void randomColor(int colorStart, int colorEnd) {
  float rand = random(colorStart, colorEnd);
  int randInt = Math.round(rand);
  switch (randInt) {
    case 0:
      fill(255, 0, 0);
      break;
    case 1:
     fill(255, 153, 0);
     break;
    case 2:
     fill(0, 255, 255);
     break; 
    case 3:
     fill(255, 255, 153);
     break;
    case 4:
     fill(204, 51, 255);
     break;
    case 5:
     fill(0, 255, 153);
     break;
    case 6:
     fill(204, 102, 255);
     break;
    case 7:
     fill(0, 0, 0);
     break;
    case 8:
     fill(255, 255, 255);
     break;
  }
}
void flyingBall() {
  
}
