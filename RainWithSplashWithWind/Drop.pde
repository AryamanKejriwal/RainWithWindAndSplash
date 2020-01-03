class Drop extends Water {
  
  PVector pos;
  
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 1);
  
  int w;
  int h;
  
  Drop(float x, float y, int W, int H) {
    pos = new PVector(x, y);
    
    w = W;
    h = H;
  }
  
  void show() {
    fill(100, 100, 220);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(vel.heading() + HALF_PI);
    rect(0, 0, w, h);
    //fill(255, 0, 0);
    //ellipse(pos.x, pos.y, 3, 3);
    popMatrix();
  }
  
  void update(PVector wind) {
    vel.add(acc);
    vel.add(wind);
    pos.add(vel);
    
    vel.x *= 0.99;
  }
}
