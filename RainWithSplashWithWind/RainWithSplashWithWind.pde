ArrayList<Water> system = new ArrayList<Water>();
int rate = 10;

PVector wind = new PVector(0, 0);

void setup() {
  fullScreen(P2D);
  background(0);
}

void draw() {
  background(0);
  //for (int i = 0; i < rate; i++) {
  //  system.add(new Drop(random(0, width), random(-25, -80), 5, 25));
  //}
  for(int i = 0; i < rate; i++) {
    if (random(0, 1) > 0.1) {
      system.add(new Drop(random(-width*0.9, width + width*0.9), random(-25, -100), 5, 25));
    }
  }

  for (Water w : system) {
    w.update(wind);
    w.show();
  }

  checkWater();
  
  if(mousePressed) {
    float mx = mouseX;
    float my = constrain(mouseY, -height/8.0, height/8.0);
    wind = new PVector((mx - width/2)/1000.0, (my - height/2)/1000.0);
  } else {
    wind = new PVector(0, 0);
  }
}

void checkWater() {
  for (int i = system.size() - 1; i >= 0; i--) {
    try {
      if (((Drop)system.get(i)).pos.y >= height) {
        system.add(i, new ParticleSystem(((Drop)system.get(i)).pos.x, height - 1, (int)random(8, 20)));
        system.remove(i + 1);
      }
    } 
    catch(ClassCastException e) {
      if (((ParticleSystem)system.get(i)).isDead) {
        system.remove(i);
      }
    }
  }
}
