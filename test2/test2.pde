float rotY = 0;
float a = 0;
float xpos, ypos;
int xdirection = 1;
int ydirection = 1;
float xspeed = 2.2;
float yspeed = 2.2;
int backColor = 1;
int backColorFix = 254;
int colorDirectionS = 1;
int colorDirectionB = 1;

  
import processing.sound.*;
SoundFile file;

void setup() {
  fullScreen(P3D);
  file = new SoundFile(this, "iceflow.mp3");
  file.play();
  smooth();
  xpos = width/2;
  ypos = height/2;
  frameRate(30);
  background(0, 255, 0);
  
}
void draw() {
  int m = millis();
  if (m >= 30000 && m <= 39750) {
    clear();
    lights();
    setBackgroundFixed();
    drawAsphere();
    drawAbox();
    drawAbox();
    drawAbox();
    drawAbox();
    drawAbox();
    
    }
  else if (m < 30000){
  lights();
  setBackground();
  drawAsphere();
  drawAbox();
  drawAbox();
  drawAbox();
  drawAbox();
  drawAbox();
  }
  else {
    exit ();
  }
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
    backColor += 2;
   }
   else if (backColor <= 254 && backColor >= 0 && colorDirectionS== -1){
    background(backColor);
    backColor -= 2;
  }
  else if (backColor >= 255 || backColor <= 0) {
   if (colorDirectionS == 1) {
     colorDirectionS *= -1;
     //backColor -= 2;
     
   }
    else if (colorDirectionS == -1){
     colorDirectionB *= -1;
     backColor += 2;
    }
  }
} //<>//

void setBackgroundFixed() {
   if (backColor <= 254 && backColorFix >= 0 && colorDirectionS== 1) {
    background(backColorFix);
    backColorFix += 2;
   }
   else if (backColorFix <= 254 && backColorFix >= 0 && colorDirectionS== -1){
    background(backColorFix);
    backColorFix -= 1;
  }
  else if (backColorFix >= 255 || backColorFix <= 0) {
   if (colorDirectionS == 1) {
     colorDirectionS *= -1;
     backColorFix -= 1;
     
   }
    else if (colorDirectionS == -1){
     colorDirectionB *= -1;
     backColorFix += 1;
    }
  }
}

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
