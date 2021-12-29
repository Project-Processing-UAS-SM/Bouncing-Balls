Ball[] balls = new Ball[10];


void setup(){
size(800,800);
for(int i = 0; i < balls.length; i++){
balls[i] = new Ball();
}
}


void draw(){
  background(255);
  for(int i = 0; i <balls.length; i++){
  balls[i].move();
  balls[i].display();
  balls[i].collision();
  }


}
