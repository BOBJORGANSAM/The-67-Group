 class Car {
   // Member Variables aka data
  color c;
  float x = 0;
  float y = 100;
  float speed;
  boolean r;

  // Constructor
  Car(color c) {
    this.c = c;
    x = random(width);
    y = random(height);
    speed = random(1, 5);
    int rand = int(random(0, 2));
    if (rand == 0) {
      r= true;
    } else {
      r = false;
    }
  }

  // Member Methods
  void display () {
    if (r == true) {
      rectMode(CENTER);
      fill(0);
      rect(x+10, y, 7, 21);
      rect(x-10, y, 7, 21);
      fill(c);
      rect(x, y, 35, 15, 3);
      fill(200);
      rect(x+5, y, 7, 15);
      fill(#FFEB08);
      rect(x+15, y, 4, 15);
    } else {
      rectMode(CENTER);
      fill(0);
      rect(x+10, y, 7, 21);
      rect(x-10, y, 7, 21);
      fill(c);
      rect(x, y, 35, 15, 3);
      fill(200);
      rect(x+5, y, 7, 15);
      fill(#FFEB08);
      rect(x+15, y, 4, 15);
    }
  }

  void move () {
    if (r == true) {
      x+=speed;
      if (x>width) {
        x=0;
      }
    } else {
      x-=speed;
      if (x<0) {
        x=width;
      }
    }
  }
}
