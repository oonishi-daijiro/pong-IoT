int START=0;
int GOAL=1;
int PLAYING=2;

class Pong {

  Pong() {
    this.rPaddle=new Paddle(width-40, int(height/2)-10, 20, 70, RIGHT_PADDLE, paddleSpeed);
    this.lPaddle=new Paddle(20, int(height/2)-10, 20, 70, LEFT_PADDLE, paddleSpeed);

    this.ball=new Ball(int(width/2), int(height/2), 20, 2, 0, this.lPaddle, this.rPaddle);
    this.objects=new Traits.Object[3];

    objects[0]=ball;
    objects[1]=rPaddle;
    objects[2]=lPaddle;
  }

  void update() {
    switch(gameState) {
    case 0: // START
      {
        ball.update(width/2, height/2);

        if (Keyboard.keys[32]) {
          ball.update(random(-1, 1)>0?-ballSpeed:ballSpeed);
          gameState=PLAYING;
        }

        if (Input.startGame()) {
          ball.update();
          ball.update(random(-1, 1)>0?-ballSpeed:ballSpeed);
          gameState=PLAYING;
        }
        rPaddle.update();
        lPaddle.update();
      }
      break;
    case 1: // GOAL
      {
        rPaddle.update();
        lPaddle.update();

        int bw=ball.getWidth();

        int lx=lPaddle.getX();
        int ly=lPaddle.getY();

        int rx=rPaddle.getX();
        int ry=rPaddle.getY();

        int ballX=ball.getX();

        if (width/2<ballX) {
          ball.update(rx-bw-20, ry+bw);
        } else if (ballX<width/2) {
          ball.update(lx+bw+20, ly+bw);
        }

        if (width/2<ballX&&Input.rightPaddleAttack()) {
          ball.update(-ballSpeed);
          gameState=PLAYING;
        } else if (ballX<width/2&&Input.leftPaddleAttack()) {
          ball.update(ballSpeed);
          gameState=PLAYING;
        }
      }
      break;
    case 2: //PLAYING
      {
        int ballX=ball.getX();
        int lx=lPaddle.getX();
        int rx=rPaddle.getX();

        if (ballX<lx) {
          int ly=lPaddle.getY();
          ball.update(lx+50, ly);
          gameState=GOAL;
          score[0]++;
        } else if (rx<ballX) {
          int ry=rPaddle.getY();
          ball.update(rx-50, ry);
          gameState=GOAL;
          score[1]++;
        }

        for (var e : objects) {
          e.update();
        }
      }
      break;
    }
  }

  void draw() {
    background(0);
    for (var e : objects) {
      e.draw();
    }

    var lPlayerScoreStr=Integer.toString(score[0]);
    var rPlayerScoreStr=Integer.toString(score[1]);

    textSize(100);
    text(rPlayerScoreStr, width/4, height*0.2);

    textSize(100);
    text(lPlayerScoreStr, width/2+width/4, height*0.2);
  }


  Ball ball;
  Paddle rPaddle;
  Paddle lPaddle;
  int ballSpeed=5;

  Traits.Object[] objects;
  int score[]={0, 0};
  int gameState=START;
  int paddleSpeed=15;
}
