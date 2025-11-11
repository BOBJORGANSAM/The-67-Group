// -------------------- Game --------------------
class Game {
  Car car;
  ArrayList<Obstacle> obstacles;
  ArrayList<FuelPickup> fuels;
  float roadWidth = 200;
  float roadX;
  float scrollY = 0;
  float speed = 4;
  int score = 0;
  boolean crashed = false;
  float fuel = 100;
  int fuelDrainRate = 1;

  Game() {
    roadX = width / 2 - roadWidth / 2;
    car = new Car(width / 2, height - 100);
    obstacles = new ArrayList<Obstacle>();
    fuels = new ArrayList<FuelPickup>();
    spawnObstacles();
    spawnFuelPickups();
  }

  void update() {
    if (!crashed) {
      scrollY += speed;
      drawRoad(scrollY);
      updateObstacles();
      drawObstacles();
      updateFuelPickups();
      car.draw();
      drawScore();
      drawFuelGauge();
      checkCollisions();
      fuel -= fuelDrainRate * 0.1;
      if (fuel <= 0) crashed = true;
    } else {
      fill(255, 0, 0);
      textSize(32);
      textAlign(CENTER);
      text("CRASH!", width / 2, height / 2);
      text("Score: " + score, width / 2, height / 2 + 40);
    }
  }

  void drawRoad(float yOffset) {
    stroke(255);
    fill(100);
    for (int y = -100; y < height + 100; y += 40) {
      float yPos = y + yOffset % 40;
      rect(roadX, yPos, roadWidth, 40);
      line(roadX + roadWidth / 2, yPos, roadX + roadWidth / 2, yPos + 40);
    }
  }

  void drawScore() {
    fill(255);
    textSize(18);
    textAlign(LEFT);
    text("Score: " + score, 10, 20);
  }

  void drawFuelGauge() {
    fill(255);
    textSize(18);
    text("Fuel: " + int(fuel), 10, 40);
    fill(255, 255, 0);
    rect(10, 50, fuel * 2, 10);
    noFill();
    stroke(255);
    rect(10, 50, 200, 10);
  }

  void spawnObstacles() {
    for (int i = 0; i < 10; i++) {
      float x = random(roadX + 20, roadX + roadWidth - 20);
      float y = -i * 150;
      obstacles.add(new Obstacle(x, y));
    }
  }

  void updateObstacles() {
    for (int i = obstacles.size() - 1; i >= 0; i--) {
      Obstacle obs = obstacles.get(i);
      obs.update(speed);
      if (obs.pos.y > car.y + 30) score++;
      if (obs.isOffScreen(height)) {
        obstacles.remove(i);
        float x = random(roadX + 20, roadX + roadWidth - 20);
        obstacles.add(new Obstacle(x, -150));
      }
    }
  }

  void drawObstacles() {
    for (Obstacle obs : obstacles) {
      obs.draw();
    }
  }

  void spawnFuelPickups() {
    for (int i = 0; i < 5; i++) {
      float x = random(roadX + 30, roadX + roadWidth - 30);
      float y = -i * 500;
      fuels.add(new FuelPickup(x, y));
    }
  }

  void updateFuelPickups() {
    for (int i = fuels.size() - 1; i >= 0; i--) {
      FuelPickup f = fuels.get(i);
      f.update(speed);
      f.draw();
      if (f.checkCollision(car)) {
        f.collected = true;
        fuel = min(fuel + 30, 100);
      }
      if (f.pos.y > height + 50 || f.collected) {
        fuels.remove(i);
        float x = random(roadX + 30, roadX + roadWidth - 30);
        fuels.add(new FuelPickup(x, -500));
      }
    }
  }

  void checkCollisions() {
    for (Obstacle obs : obstacles) {
      if (obs.collidesWith(car)) crashed = true;
    }
    if (car.x < roadX + 20 || car.x > roadX + roadWidth - 20) crashed = true;
  }

  void reset() {
    car = new Car(width / 2, height - 100);
    scrollY = 0;
    score = 0;
    crashed = false;
    fuel = 100;
    obstacles.clear();
    fuels.clear();
    spawnObstacles();
    spawnFuelPickups();
  }
}
