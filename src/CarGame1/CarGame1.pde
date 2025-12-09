Main game; 
String state = "HOME";

void setup() {
  size(400, 600);
  game = new Main();
}

void draw() {
  background(50, 150, 50);
  game.update();

  if (state.equals("HOME")) {
    drawHomeScreen();
  } else if (state.equals("GAME")) {
    game.update();
  } else if (state.equals("SETTINGS")) {
    drawSettingsScreen();
  }
}

class Car {
  PImage img;
  float x, y;

  Car(float startX, float startY) {
    x = startX;
    y = startY;
    img = createCarImage();
  }

  void draw() {
    imageMode(CENTER);
    image(img, x, y);
  }

  void moveLeft() {
    x -= 20;
  }
  void moveRight() {
    x += 20;
  }

  PImage createCarImage() {
    PGraphics pg = createGraphics(40, 60);
    pg.beginDraw();
    pg.background(0, 0);
    pg.fill(0);
    pg.rect(7, 40, 5, 10);
    pg.rect(27, 40, 5, 10);
    pg.rect(7, 10, 5, 10);
    pg.rect(27, 10, 5, 10);
    pg.fill(255, 0, 0);
    pg.rect(10, 10, 20, 40);
    pg.fill(#DBFFFC);
    pg.rect(10, 10, 20, 15);
    pg.endDraw();
    return pg.get();
  }
}

void keyPressed() {
  if (state.equals("GAME")) {
    if (!game.crashed) {
      if (keyCode == 65) game.car.moveLeft();
      if (keyCode == 68) game.car.moveRight();
      if (keyCode == LEFT) game.car.moveLeft();
      if (keyCode == RIGHT) game.car.moveRight();
    } else {
      if (key == ENTER) {
        state = "HOME";
      }
    }
  }
}

void mousePressed() {
  if (state.equals("HOME")) {
    if (mouseX > 150 && mouseX < 250 && mouseY > 250 && mouseY < 300) {
      state = "GAME";
      game.reset();
    }
    if (mouseX > 150 && mouseX < 250 && mouseY > 320 && mouseY < 370) {
      state = "SETTINGS";
    }
  } else if (state.equals("SETTINGS")) {
    if (mouseX > 150 && mouseX < 250 && mouseY > 500 && mouseY < 550) {
      state = "HOME";
    }
  }
}

void drawHomeScreen() {
  background(#DBDBDB);
  fill(255);
  textAlign(CENTER);
  textSize(40);
  fill(0);
  text("Racing Game", width/2, 150);

  fill(#29980B);
  rect(125, 250, 150, 50);
  fill(0);
  textSize(24);
  text("RACE", 200, 283);

  fill(#3136FF);
  rect(125, 320, 150, 50);
  fill(0);
  text("SETTINGS", 200, 353);
}

void drawSettingsScreen() {
  background(#DBDBDB);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  fill(40);
  text("Settings", width/2, 150);

  textSize(25);
  text("Difficulty", width/2, 250);
  rect(50, 270, 300, 5);
  //rect(0,0,0,0); for the slider - Sam

  fill(#DE0004);
  rect(50, 500, 300, 50);
  fill(0);
  textSize(30);
  text("BACK TO RACING", 200, 535);

  fill(150, 0, 0);
  fill(40);
  textSize(25);
  text("Sound", width/2, 330);
  rect(50, 345, 300, 5);
  //rect(0,0,0,0); for the slider - Sam
}
