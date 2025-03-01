Player player = new Player();
ArrayList<Spear> spears; 
int savedTime = millis();
int totalTime = 1000;


void setup() {
  background(0);
  fullScreen();
  spears = new ArrayList<Spear>();
  
}

void draw() {
  background(0);
  spawnSpears();
  player.display();

  for (int i = 0; i < spears.size(); i++) {
    spears.get(i).display();
    collison(player,spears.get(i));
  }
  
  if (keyPressed) {
    player.defend(key);
  }

}
  
  
void spawnSpears() {
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    spears.add(new Spear());
    savedTime = millis();
  }
}



void collison(Player p,Spear s) {
  if (dist(p.pos.x,p.pos.y,s.pos.x,s.pos.y) < 130) {
    spears.remove(s);
    p.dead = true;
  }
}
