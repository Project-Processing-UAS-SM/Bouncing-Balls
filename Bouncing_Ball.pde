int numBalls = 12;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
ParticleSystem ps;

void setup(){
size(800,800);
resetPage();
}

void keyPressed(){
  resetPage();
}

void resetPage(){
  for(int i = 0; i < balls.length; i++){
  balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  ps = new ParticleSystem(new PVector(width/2, 50));
  }
}

void draw(){
  background(0);
  for(int i = 0; i <balls.length; i++){
  balls[i].move();
  balls[i].display();
  balls[i].collide();
  ps.addParticle();
  
  }


}
