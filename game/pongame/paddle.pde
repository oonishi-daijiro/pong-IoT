int RIGHT_PADDLE = 0;
int LEFT_PADDLE = 1;

public class Paddle implements  Traits.Object {

  Paddle(int x, int y, int w, int h, int place, int speed) {
    this.x=x;
    this.y=y;
    this.paddleWidth=w;
    this.paddleHeight=h;
    this.place=place;
    this.speed=speed;
  }

  public void draw() {
    rect(x, y, paddleWidth, paddleHeight);
  }

  void update() {
    isMoving=false;
    
    if (place==LEFT_PADDLE) {

      if (Input.moveUpLeftPaddle()) {
        if (y>0) {
          isMoving=true;
          y-=speed;
        }
      }


      if (Input.moveDownLeftPaddle()) {
        if (y+paddleHeight<height) {
          isMoving=true;
          y+=speed;
        }
      }


      if (Keyboard.keys['q']) {
        if (y-paddleHeight>0) {
          isMoving=true;
          y-=speed;
        }
      }
      if (Keyboard.keys['a']) {
        if (y+paddleHeight<height) {
          isMoving=true;
          y+=speed;
        }
      }
    }

    if (place==RIGHT_PADDLE) {
      if (Input.moveUpRightPaddle()) {
        if (y>0) {
          isMoving=true;
          y-=speed;
        }
      }

      if (Input.moveDownRightPaddle()) {
        if (y+paddleHeight<height) {
          isMoving=true;
          y+=speed;
        }
      }


      if (Keyboard.keys['o']) {
        if (y-paddleHeight>0) {
          isMoving=true;
          y-=speed;
        }
      }
      if (Keyboard.keys['l']) {
        if (y+paddleHeight<height) {
          isMoving=true;
          y+=speed;
        }
      }
    }
  }

  boolean isMoving() {
    return isMoving;
  }

  int getX() {
    return x;
  }
  int getY() {
    return y;
  }

  int getWidth() {
    return paddleWidth;
  }

  int getHeight() {
    return paddleHeight;
  }

  private int x, y;
  private int paddleWidth, paddleHeight;
  private int place;
  private int speed;
  private Boolean isMoving=false;
}
