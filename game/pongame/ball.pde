class Ball implements Traits.Object {
  Ball(int x, int y, int ballWidth, int speedX, int speedY, Paddle lPaddle, Paddle rPaddle) {
    this.x=x;
    this.y=y;
    this.speedX=speedX;
    this.speedY=speedY;
    this.ballWidth=ballWidth;
    this.rPaddle=rPaddle;
    this.lPaddle=lPaddle;
  }
  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
  int getWidth() {
    return ballWidth;
  }

  void update() {
    x+=speedX;
    y+=speedY;

    this.x+=speedX;
    this.y+=speedY;
    if (y<0||y>height) {
      speedY*=-1;
    }

    int lw=lPaddle.getWidth();
    int lh=lPaddle.getHeight();

    int lx = lPaddle.getX()-(lw/2);
    int ly = lPaddle.getY()+(lh/2);

    int rw=rPaddle.getWidth();
    int rh=rPaddle.getHeight();

    int rx=rPaddle.getX()+(rw/2);
    int ry=rPaddle.getY()+(rh/2);

    int topY = y;
    int bottomY = y + ballWidth;

    Boolean isBallInLeftPaddleXrange = x < lx + lw;

    Boolean isBallInLeftPaddleYrange =
      (ly - (lh / 2) < topY && topY < ly + (lh / 2) )||
      (ly - (lh / 2) < bottomY && bottomY < ly + (lh / 2));

    Boolean isBallInRightPaddleXrange = rx < x + ballWidth;

    Boolean isBallInRightPaddleYrange =
      ry - (rh / 2) < topY && topY < ry + (rh / 2) ||
      ry - (rh / 2) < bottomY && bottomY < ry + (rh / 2);

    if (isBallInLeftPaddleXrange && isBallInLeftPaddleYrange) {
      if (lPaddle.isMoving()) {
        speedY += random(-2, 2);
      }
      speedX *= -1;
    }

    if (isBallInRightPaddleXrange && isBallInRightPaddleYrange) {

      if (rPaddle.isMoving()) {
        speedY += random(-2, 2);
      }
      speedX *= -1;
    }
  }

  void update(int x, int y) {
    this.x=x;
    this.y=y;
  }

  void update(int speedX) {
    this.speedX=speedX;
  }

  public void draw() {
    fill(255);
    rect(x, y, ballWidth, ballWidth);
  }

  private  int x, y;
  private int ballWidth;
  private int speedX, speedY;
  private Paddle rPaddle;
  private Paddle lPaddle;
}
