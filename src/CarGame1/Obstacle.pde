  PVector pos;
  PImage obstacleImg;  

  Obstacle(float x, float y) {
    pos = new PVector(x, y);
    obstacleImg = loadImage("trafficcone.png");  
  }

  void update(float speed) {
    pos.y += speed;
  }

  void draw() {
    imageMode(CENTER);
    if (obstacleImg != null) {
      image(obstacleImg, pos.x, pos.y, 50, 50);
    } else {
      fill(0);
      rect(pos.x - 10, pos.y - 10, 20, 20);
    }
  }

  boolean isOffScreen(float height) {
    return pos.y > height + 50;
  }

  boolean collidesWith(Car car) {
    return dist(car.x, car.y, pos.x, pos.y) < 25;
  }
}
