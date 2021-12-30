int jumlah=5;
float spring = 0.05;
float friction = -1;
boolean [] keys = new boolean[128];

Ball[] balls = new Ball[jumlah];
ParticleSystem ps;

void setup(){
size(800,800);
resetPage();
}

void keyPressed(){
  if (key=='r')
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
  //balls[i].move();
  //balls[i].display();
  //balls[i].collide();
  balls[i].keyPressed();
  ps.addParticle();
  
  }
}
