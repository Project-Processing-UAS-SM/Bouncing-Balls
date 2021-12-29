class Ball{
float x;
float y;
float size;
float speedX;
float speedY;
float flipcoinX;
float flipcoinY;
float r;
float g;
float b;

Ball(){
  r = random(255);
  g = random(255);
  b = random(255);
x = random(width);
y = random(height);
size = random(50,100);
speedX=random(2,4);
speedY=random(2,4);
flipcoinX = random(0,1);
flipcoinY = random(0,1);
if(flipcoinX> 0.5) {
 speedX = speedX*-1; 
}
if(flipcoinY> 0.5) {
 speedY = speedY*-1; 
}

}

void move(){
 x = x + speedX; 
 if((x > width) || (x < 0)){
   fill(r,g,b); 
   speedX = speedX*-1; 
  
 }
  y = y + speedY; 
 if((y > height) || (y < 0)){
  speedY = speedY*-1; 
  fill(r,g,b); 
 }
 if(dist(x,y,mouseX, mouseY) <= size/2){
    fill(255, 0, 0);    
  }
  else{
   fill(0, 255, 0); 
  }
 
}

void collision(){
if(dist(x,y,mouseX, mouseY) <= size/2){
    fill(255, 0, 0);    
  }
  else{
   fill(0, 255, 0); 
  }
}

void display(){
 noStroke();
 fill(r,g,b);
 ellipse(x,y,size,size);
}
  



}
