float speed = 0; float easing = 0.07;
void setup(){
  size(1000,1000);
  background(255);
}


void draw() {
  
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
speed += (target - speed) * easing;
 
  if (mousePressed && (mouseX<500)) {
    stroke(#96F7EB,80);
    strokeWeight(speed/2);
line(mouseX, mouseY, pmouseX, pmouseY);
  } 
  else if (mousePressed && (mouseX>=500)) {
    stroke(#FA97F8,80);
    strokeWeight(speed/2);
line(mouseX, mouseY, pmouseX, pmouseY);
  } 
  else {
    stroke(#97B7FA,80);
    strokeWeight(speed/2);
line(mouseX, mouseY, pmouseX, pmouseY);
  }

}
