
Pong game;

void setup() {
  Input.init();
  size(800, 600);
  frameRate(60);
  fill(0, 127, 255);
  noStroke();
  game=new Pong();
  
}

void draw() {
  Input.readInput();
  game.update();
  game.draw();
  Input.discard();
}
