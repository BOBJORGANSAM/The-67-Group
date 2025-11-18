//Sam Harmon

Game game;   // Jack - I removed the Car Car; (11/18)
String state = "HOME";

void setup() {
  size(400, 600);
  game = new Game();
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

  void moveLeft() { x -= 20; }
  void moveRight() { x += 20; }

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
    pg.endDraw();
    return pg.get();
  }
}

void keyPressed() {
  if (state.equals("GAME")) {
    if (!game.crashed) {
      if (keyCode == LEFT) game.car.moveLeft();
      if (keyCode == RIGHT) game.car.moveRight();
    } else {
      if (key == ENTER) {
        game.reset();
      }
    }
  }
}

void mousePressed() {
  if (state.equals("HOME")) {
    // Play button
    if (mouseX > 150 && mouseX < 250 && mouseY > 250 && mouseY < 300) {
      state = "GAME";
      game.reset();
    }
    // Settings button
    if (mouseX > 150 && mouseX < 250 && mouseY > 320 && mouseY < 370) {
      state = "SETTINGS";
    }
  } else if (state.equals("SETTINGS")) {
    // Simple back button
    if (mouseX > 150 && mouseX < 250 && mouseY > 500 && mouseY < 550) {
      state = "HOME";
    }
  }
}

void drawHomeScreen() {
  background(#BCBCBC);
  fill(255);
  textAlign(CENTER);
  textSize(40);
  fill(#3136FF);
  text("Racing Game", width/2, 150);
  
  fill(0, 200, 0);
  rect(125, 250, 150, 50);
  fill(255);
  textSize(24);
  text("RACE", 200, 280);
  
  fill(#3136FF);
  rect(125, 320, 150, 50);
  fill(255);
  text("SETTINGS", 200, 350);
}

void drawSettingsScreen() {
  background(80, 80, 120);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("Settings", width/2, 150);
  
  textSize(18);
  text("Difficulty", width/2, 250);

  fill(150, 0, 0);
  rect(50, 500, 300, 50);
  fill(255);
  text("BACK TO RACING", 200, 530);
}
