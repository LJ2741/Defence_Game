Player player = new Player();
ArrayList<Spear> spears; 
JSONObject json;
int savedTime = millis();
int totalTime = 1000;
int lives = 3;
int score = 0;
int highscore;

void setup() {
  background(0);
  fullScreen();
  json = loadJSONObject("data/highscore.json");
  highscore = json.getInt("highscore");
  spears = new ArrayList<Spear>();
  
}

void draw() {
  background(0);
  displayText();
  reset();
  spawnSpears();
  player.display();
  
  for (int i = 0; i < spears.size(); i++) {
    spears.get(i).display();
    collison(player,spears.get(i));
  }
  
  if (keyPressed) {
    player.defend(key);
    
  } else if (keyCode == BACKSPACE) { // allows the user to reset their highscore by pressing backspace
    highscore = 0;
    json = loadJSONObject("data/highscore.json");
    json.setInt("highscore",highscore);
    saveJSONObject(json,"data/highscore.json");
    
  } else {
    
    player.spos = new PVector(0,0);
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
  if (dist(p.pos.x,p.pos.y,s.pos.x,s.pos.y) < 120 && p.dead == false) {
    spears.remove(s);
    lives -= 1;
  }
  
  if (dist(p.spos.x,p.spos.y,s.pos.x,s.pos.y) < 65) {
    spears.remove(s);
    score += 100;
  }
}

void displayText() {
  textSize(70);
  textAlign(LEFT);
  text("Score: " + score,7,90);
  textAlign(CENTER);
  text("Lives: " + lives,displayWidth/2,90);
  textAlign(RIGHT);
  text("HighScore: " + highscore,displayWidth - 7,90);
}
  
void reset() {
  if (lives <= 0) {
    lives = 0;
    score = 0;
    lives = 3;
    
    for (int i = 0; i < spears.size(); i++) {
      spears.remove(i);
    }
    
    if (score > highscore) {
      highscore = score;
      json = loadJSONObject("data/highscore.json");
      json.setInt("highscore",highscore);
      saveJSONObject(json,"data/highscore.json");
   
    }
  }
}
    
  
  
