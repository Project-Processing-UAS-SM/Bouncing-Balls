class Ball{
//float x;
//float y;
float size;
//float speedX;
//float speedY;
//float flipcoinX;
//float flipcoinY;
float r;
float g;
float b;
float x, y;
float diameter;
float vx;
float vy;
int id;
Ball[] others;

Ball(float xin, float yin, float din, int idin, Ball[] oin){
  x = xin;
  y = yin;
  diameter = din;
  id = idin;
  others = oin;
  r = random(255);
  g = random(255);
  b = random(255);
//x = random(width);
//y = random(height);
size = random(50,100);
vx=random(3,5);
vy=random(3,5);

//flipcoinX = random(0,1);
//flipcoinY = random(0,1);
//if(flipcoinX> 0.5) {
// speedX = speedX*-1; 
//}
//if(flipcoinY> 0.5) {
// speedY = speedY*-1; 
//}

}

//void move(){
// x = x + speedX; 
// if((x > width) || (x < 0)){
//   fill(r,g,b); 
//   speedX = speedX*-1; 
  
// }
//  y = y + speedY; 
// if((y > height) || (y < 0)){
//  speedY = speedY*-1; 
//  fill(r,g,b); 
// }
 
//}

void move() {
    //vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
      //fill(r,g,b);
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
      //fill(r,g,b);
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
      //fill(r,g,b);
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
      //fill(r,g,b);
    }
  }

void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
        ps.run();
      }
    }   
  }

void display(){
 noStroke();
 fill(r,g,b);
 ellipse(x,y,size,size);
}
  



}
