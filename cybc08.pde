Trs[] trs = new Trs[100];
int[] colors={#88A9FA,#AA9CFA,#3A38E8,#B1ACF7,#81B2F5,#236BDB,#FFFFFF,#F7F8FA};
int distance = 120;
void setup()
{
  size(800,800);
  for(int i =0;i<trs.length;i++)
  {
    trs[i]=new Trs(random(width),random(height));
  }
}
void draw()
{
  background(#031239);
  for(int i = 0;i<trs.length;i++)
  {
    trs[i].update();
    trs[i].display();
    trs[i].check();
  }
  for(int i =0;i<trs.length;i++)
  {
    for(int j =0;j<trs.length;j++)
    {
     strokeWeight(2);
     stroke(colors[trs[i].c],50);
     if(dist(trs[i].x1,trs[i].y1,trs[j].x1,trs[j].y1)<distance)
     line(trs[i].x1,trs[i].y1,trs[j].x1,trs[j].y1);
     if(dist(trs[i].x1,trs[i].y1,trs[j].x2,trs[j].y2)<distance)
     line(trs[i].x1,trs[i].y1,trs[j].x2,trs[j].y2);
     if(dist(trs[i].x1,trs[i].y1,trs[j].x3,trs[j].y3)<distance)
     line(trs[i].x1,trs[i].y1,trs[j].x3,trs[j].y3);
     //
     if(dist(trs[i].x2,trs[i].y2,trs[j].x1,trs[j].y1)<distance)
     line(trs[i].x2,trs[i].y2,trs[j].x1,trs[j].y1);
     if(dist(trs[i].x1,trs[i].y1,trs[j].x2,trs[j].y2)<distance)
     line(trs[i].x2,trs[i].y2,trs[j].x2,trs[j].y2);
     if(dist(trs[i].x2,trs[i].y2,trs[j].x3,trs[j].y3)<distance)
     line(trs[i].x2,trs[i].y2,trs[j].x3,trs[j].y3);
     //
     if(dist(trs[i].x3,trs[i].y3,trs[j].x1,trs[j].y1)<distance)
     line(trs[i].x3,trs[i].y3,trs[j].x1,trs[j].y1);
     if(dist(trs[i].x3,trs[i].y3,trs[j].x2,trs[j].y2)<distance)
     line(trs[i].x3,trs[i].y3,trs[j].x2,trs[j].y2);
     if(dist(trs[i].x3,trs[i].y3,trs[j].x3,trs[j].y3)<distance)
     line(trs[i].x3,trs[i].y3,trs[j].x3,trs[j].y3);
     
    }
  }
}
class Trs
{
  float x1,y1,x2,y2,x3,y3,x,y;
  float angle,aspeed;
  float vx,vy;
  float r;
  int c;
  Trs(float x,float y)
{
this.x=x;
this.y=y;
angle=random(360);
r=random(10,30);
aspeed = random(1)>0.5 ? random(-4,0.02) : random(0.2,4);
vx=random(1)>0.5?random(-2,-0.1):random(0.1,2);
vy=random(1)>0.5?random(-2,-0.1):random(0.1,2);
c=(int)random(colors.length);
}
void update()
{
  x+=vx;
  y+=vy;
  x1=x+r*cos(radians(angle));
  x2=x+r*cos(radians(angle+120));
  x3=x+r*cos(radians(angle+240));
  y1=y+r*sin(radians(angle));
  y2=y+r*sin(radians(angle+120));
  y3=y+r*sin(radians(angle+240));
  angle+=aspeed;
}
void display()
{
  noStroke();
  fill(colors[c],100);
  triangle(x1,y1,x2,y2,x3,y3);
}
void check()
{
  if(x>width)vx*=-1;
  if(x<0)vx*=-1;
  if(y>height)vy*=-1;
  if(x<0)vy*=-1;
}
}

  
