PImage car;
float carX;
float carY;
float speed = 4;
float roadWidth = 200;
float roadX;
String obs;
float scrollY = 0;

ArrayList<PVector> obstacles = new ArrayList<PVector>();
int score = 0;
boolean crashed = false;

void setup() {
  size(400, 600);
  car = createCarImage();
  carX = width / 2;
  carY = height - 100;
  roadX = width / 2 - roadWidth / 2;
  spawnObstacles();
}

void draw() {
  background(50, 150, 50); // green grass

  if (!crashed) {
    scrollY += speed;
    drawRoad(scrollY);
    updateObstacles();
    checkCollisions();
    drawObstacles();
    drawCar();
    drawScore();
  } else {
    fill(255, 0, 0);
    textSize(32);
    textAlign(CENTER);
    text("CRASH!", width / 2, height / 2);
    text("Score: " + score, width / 2, height / 2 + 40);
  }
}

void keyPressed() {
  if (keyCode == LEFT) carX -= 10;
  if (keyCode == RIGHT) carX += 10;
}

void drawRoad(float yOffset) {
  stroke(255);
  fill(100);
  for (int y = -100; y < height + 100; y += 40) {
    float yPos = y + yOffset % 40;
    rect(roadX, yPos, roadWidth, 40);
    stroke(255);
    line(roadX + roadWidth / 2, yPos, roadX + roadWidth / 2, yPos + 40);
  }
}

void drawCar() {
  imageMode(CENTER);
  image(car, carX, carY);
}

void drawScore() {
  fill(255);
  textSize(18);
  textAlign(LEFT);
  text("Score: " + score, 10, 20);
}

void spawnObstacles() {
  for (int i = 0; i < 10; i++) {
    float x = random(roadX + 20, roadX + roadWidth - 20);
    float y = -i * 150;
    obstacles.add(new PVector(x, y));
  }
}

void updateObstacles() {
  for (int i = obstacles.size() - 1; i >= 0; i--) {
    PVector obs = obstacles.get(i);
    obs.y += speed;
    
    class Obstacle {
  PVector pos;
  boolean scored;

  Obstacle(float x, float y) {
    pos = new PVector(x, y);
    scored = false;
  }
}

    // Passed obstacle
    if (obs.y > carY + 30) {
      score++;
      obs.z = 1; // mark as scored
    }

    // Remove off-screen
    if (obs.y > height + 50) {
      obstacles.remove(i);
      float x = random(roadX + 20, roadX + roadWidth - 20);
      float y = -150;
      obstacles.add(new PVector(x, y));
    }
  }
}

void drawObstacles() {
  fill(0);
  for (PVector obs : obstacles) {
    rect(obs.x - 10, obs.y - 10, 20, 20);
  }
}

void checkCollisions() {
  for (PVector obs : obstacles) {
    if (dist(carX, carY, obs.x, obs.y) < 25) {
      crashed = true;
    }
  }

  if (carX < roadX + 20 || carX > roadX + roadWidth - 20) {
    crashed = true;
  }
}

PImage createCarImage() {
  PGraphics pg = createGraphics(40, 60);
  pg.beginDraw();
  pg.background(0, 0);
  pg.fill(255, 0, 0);
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
