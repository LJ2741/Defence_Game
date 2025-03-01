class Player {
  
  boolean dead = false;
  PVector pos,spos;
  
  Player() {
    spos = new PVector(0,0);
  }
  
  
  void display() {
    if (dead == false) {
      pos = new PVector(displayWidth/2,displayHeight/2);
      ellipse(pos.x,pos.y,75,75);
    }
  }
  
  void defend(char k) {
    if (dead == false) {
      rectMode(CENTER);
      
      if (k == 'a') {
        spos = new PVector(displayWidth/2 - 125,displayHeight/2);
        rect(displayWidth/2 - 125,displayHeight/2,10,100); // left
      
    
      } else if (k == 'd') {
        spos = new PVector(displayWidth/2 + 125,displayHeight/2);
        rect(displayWidth/2 + 125,displayHeight/2,10,100);// right
      
      
      } else if (k == 'w') {
        spos = new PVector(displayWidth/2,displayHeight/2 - 150);
        rect(displayWidth/2,displayHeight/2 - 150,100,10); // top
      
      
      } else if (k == 's') {
        spos = new PVector(displayWidth/2,displayHeight/2 + 150);
        rect(displayWidth/2,displayHeight/2 + 150,100,10); // bottom
      } else {
        spos = new PVector(0,0);
      }
    }
    
  }
    
}
  
