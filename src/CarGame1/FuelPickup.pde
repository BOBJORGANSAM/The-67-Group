// -------------------- Fuel Pickup --------------------
class FuelPickup {
  PVector pos;
  boolean collected;

  FuelPickup(float x, float y) {
    pos = new PVector(x, y);
    collected = false;
  }

  void update(float speed) {
    pos.y += speed;
  }

  void draw() {
    if (!collected) {
      fill(255, 255, 0);
      ellipse(pos.x, pos.y, 15, 15);
    }
  }

  boolean checkCollision(Car car) {
    return !collected && dist(car.x, car.y, pos.x, pos.y) < 20;
  }
}
