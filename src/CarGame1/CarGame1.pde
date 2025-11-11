Car car;
Game game;

void setup() {
  size(400, 600);
  game = new Game();
}

void draw() {
  background(50, 150, 50);
  game.update();
}

void keyPressed() {
  if (!game.crashed) {
    if (keyCode == LEFT) game.car.moveLeft();
    if (keyCode == RIGHT) game.car.moveRight();
  } else {
    if (key == ENTER) {
      game.reset();
    }
  }
}

// -------------------- Car --------------------
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
    pg.endDraw();
    return pg.get();
  }
}
