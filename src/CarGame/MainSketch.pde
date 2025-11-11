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
