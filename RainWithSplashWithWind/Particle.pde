class Particle {
  
  PVector pos;
  PVector vel;
  
  PVector acc =  new PVector(0, 1);
  
  float radius;
  
  Particle(float x, float y, float xVel, float yVel, float r) {
    pos = new PVector(x, y);
    vel = new PVector(xVel, yVel);
    
    radius = r;
  }
  
  void show() {
    fill(100, 100, 220);
    noStroke();
    ellipse(pos.x, pos.y, radius, radius);
  }
  
  void update(PVector wind) {
    vel.add(acc);
    vel.add(wind);
    pos.add(vel);
    
    vel.x *= 0.99;
  }
}
