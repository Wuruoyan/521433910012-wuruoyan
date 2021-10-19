String s = "编程好难，我学不会";
PFont f;
float theta;

void setup()
{
  size(800,800);
  f=createFont("宋体",48,true);
}

void draw()
{
  background(255);
  textFont(f);
  fill(random(0,255),random(0,255),random(0,255));
  translate(width/2,height/2);
  rotate(theta);
  textAlign(CENTER);
  text(s,0,0);
  
  theta +=0.05;
}
