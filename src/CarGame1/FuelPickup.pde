class FuelPickup {
  PVector pos;
  boolean collected;
  PImage fuelImg;   

  FuelPickup(float x, float y) {
    pos = new PVector(x, y);
    collected = false;
    fuelImg = loadImage("gascan.png");  
  }

  void update(float speed) {
    pos.y += speed;
  }

  void draw() {
    if (!collected) {
      imageMode(CENTER);
      if (fuelImg != null) {
        image(fuelImg, pos.x, pos.y, 40, 40); 
      } else {
        fill(255, 255, 0);
        ellipse(pos.x, pos.y, 15, 15);
      }
    }
  }

  boolean checkCollision(Car car) {
    return !collected && dist(car.x, car.y, pos.x, pos.y) < 20;
  }
}
