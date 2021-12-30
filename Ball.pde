class Ball{
char a;
float r, g, b, x, y, diameter, vx, vy;
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
vx=random(3,5);
vy=random(3,5);


}


void move() {
    
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
    for (int i = id + 1; i < jumlah; i++) {
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
  
void keyPressed(){
 if (key=='a')
 //jumlah= 5;
 display();
 move();
 collide();
}

void display(){
 noStroke();
 fill(r,g,b);
 ellipse(x,y,diameter,diameter);
}
}
