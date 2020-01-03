class ParticleSystem extends Water {

  boolean isDead = false;
  ArrayList<Particle> particles;

  ParticleSystem(float x, float y, int n) {

    particles = new ArrayList<Particle>();

    for (int i = 0; i < n; i++) {
      float yVel = (float)Math.random() * -10 - 5;
      particles.add(new Particle(x, y, random(-5, 5), yVel, random(80.0/n)));
      
      println(yVel);
    }
  }

  void show() {
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).show();
    }
  }

  void update(PVector wind) {
    for (int i = particles.size() - 1; i >=0; i--) {
      if (particles.get(i).pos.y > height) {
        particles.remove(i);
      } else {
        particles.get(i).update(wind);
      }
    }
    
    if(particles.size() == 0) {
      isDead = true;
    }
  }
}
