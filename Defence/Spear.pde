class Spear {
  
  
  PVector velocity,pos;
  int w,h;
  
  Spear() {
    int ran = int(round(random(0,4)));
    
    if (ran == 0) {
      pos = new PVector(0,715); // left
      velocity = new PVector(10,0);
      w = 75;
      h = 10;
    } 
    
    if (ran == 1) {
      pos = new PVector(2500,715); // right
      velocity = new PVector(-10,0);
      w = 75;
      h = 10;
    } 
    
    if (ran == 2) {
      pos = new PVector(1275,0); // top
      velocity = new PVector(0,10);
      w = 10;
      h = 75;
    } 
    
    if (ran == 3) {
      pos = new PVector(1275,1800); // bottom
      velocity = new PVector(0,-10);
      w = 10;
      h = 75;
    } 
    
    if (ran == 4) {
      pos = new PVector(-100,-100);
      velocity = new PVector(0,-100);
      w = 1;
      h = 1;
    }
    
  }
  
  
  void display() {
    pos.add(velocity);
    rect(pos.x,pos.y,w,h);
  }
  
  
  
  
  
  
}
