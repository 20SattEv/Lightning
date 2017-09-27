PImage img;

Player wizard;

void setup() {
  size(500, 500);
  background(255, 255, 200);
  img = loadImage("data/stickMan.png");
  wizard=new Player();
}

void draw() {
  wizard.show();
}

class Player {
  int x;
  int y;
  int imgWidth;
  int imgHeight;
  float scale=.75;
  int startX;
  int endX=150;
  int startY;
  int endY=150;

  Player() {
    x=10;
    y=0;
    imgWidth = 67;
    imgHeight = 201;
  }

  void show() {
    image(img, x, y, imgWidth * scale, imgHeight * scale);
  }
  void moveUp() {
    y--;
  }
  void moveDown() {
    y++;
  }
  void zap() {
    startX=x+40;
    startY=y+76;
    endX=startX+(int)(Math.random()*10);
    endY=startY+(int)(Math.random()*10);
    stroke(30);
    while (endX<=500) {
      line(startX, startY, endX, endY);
      startX=endX;
      startY=endY;
      endX=endX+(int)(Math.random()*10);
      endY=endY+(int)(Math.random()*10);
    }
  }
}

void keyPressed() {
  if (key == 'w') {
    wizard.moveUp();
  }
  if (key == 's') {
    wizard.moveDown();
  }
}

void mousePressed(){ 
  wizard.zap();
}
