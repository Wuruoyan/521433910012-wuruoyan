float t=0;
float t1=0;
float v0 = 0;
float s = 0;
float s0 = 0;
float a = 9.8;
boolean dir = false;
float hight = 900;
float dump = 0.98;
float xpos = 0;
float xposBlock = 0;
float r = 50;
float vx =1;
boolean run = true ;
boolean manual = false;
boolean restart = false;
boolean isFail = false;
float hight1 = 600;


void setup(){
  size(1200,900,P3D);
  colorMode(RGB,255);
  background(0);
  xpos = random(400,800);
}

void draw(){
  PFont font = createFont("Segoe UI",20);
  textFont(font);
  background(255);
  fill(0,102,153);
  text("Stop key b",10,30);
  text("Auto key a",10,70);
  text("Move Left key <-",10,110);
  text("Move Right key ->",10,150);
  if(run){
    caculateYPos();
    caculateXPos();
    drawBowBow();
    drawBowBlock();
  }
  failCheck();
  delay(10);
}

void drawBowBow(){
  noStroke();
  lights();
  translate(xpos,s,0.0);
  fill(100,100,255);
  sphere(r);
}

void drawBowBlock(){
  noStroke();
  lights();
  translate(-xpos,hight1-s,0.0);
  fill(100,100,200);
  rect(xposBlock-300,0,600,40);
}

void caculateYPos()
{
  s = s0 + int(dir)*v0*t + a*t*t/2;
  if (s > (hight-r)){
    dir = true;
    v0 = v0 + dump*a*t;
    v0 = -v0;
    s0 = hight-r;
    t = 0;
  }
  t = t + 0.1;
}

void caculateXPos()
{
  t1 = t1 + 0.05;
  xpos = xpos + vx*t1;
  if ( xpos < r){
    vx = -vx;
    t1 = 0;
    xpos = r;
  }else if (xpos > 1200-r){
    xpos = 1200 - r;
    vx = -vx;
    t1 = 0;
  }
  
  if (!manual){
    xposBlock = xpos;
  }
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == LEFT){
      xposBlock = xposBlock - 50;
    }else if (keyCode == RIGHT){
      xposBlock = xposBlock + 50;
    }
  } else if(key == 'b'){
    run = !run;
  }else if (key =='a'){
    run = true;
    manual = false;
  }else if (key =='m'){
    manual = true;
  }else if (key =='r'){
    restart = false;
  }
  print(key);
}

void failCheck()
{
  if(isFail){
    PFont font1 = createFont("Segoe UI",64);
    textFont(font1);
    fill(100,100,255);
    text("you fail,press a to restart",100,450);
  }
  if (s+r>=hight1){
    hight = 900;
    if (xposBlock-300.0 > xpos || xpos > xposBlock+300.0){
      isFail = true;
      run = false;
    }else{
      hight = hight1;
    }
  }
}
  
  
