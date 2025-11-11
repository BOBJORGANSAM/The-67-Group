// Alisa Pavlova | 04.11.2025 | Background

Car player;
Car[] cars= new Car [1];

void setup() {
  size(500,600);
  player = new Car(color(random(255), random(255), random(255)));
}

void draw() {
  background(#13eb3a);
  fill(#596a6e);
  rectMode(CENTER);
  rect(250,300,250,600);
  player.display();
  player.move();
}
