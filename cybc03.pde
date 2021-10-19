Drop[] drops = new Drop[100];



void setup(){
  size(800,800);
  for (int i = 0;i < drops.length; i++){
  drops[i] =new Drop();
}
}

void draw(){
  background(random(0,255));
 for (int i = 0;i < drops.length; i++){
  drops[i].show();
  drops[i].fall();
 }
}
