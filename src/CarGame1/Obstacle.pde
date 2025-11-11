// -------------------- Obstacle --------------------
class Obstacle {
  PVector pos;

  Obstacle(float x, float y) {
    pos = new PVector(x, y);
  }

  void update(float speed) {
    pos.y += speed;
  }

  void draw() {
    fill(0);
    rect(pos.x - 10, pos.y - 10, 20, 20);
  }

  boolean isOffScreen(float height) {
    return pos.y > height + 50;
  }

  boolean collidesWith(Car car) {
    return dist(car.x, car.y, pos.x, pos.y) < 25;
  }
}
