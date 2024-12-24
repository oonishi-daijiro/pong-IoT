import processing.serial.*;


public static class Input {
  public static void init() {
    if (Serial.list().length>=4) {
      rPlayerInputPort=new Serial(pr1, Serial.list()[2], 115200);
      lPlayerInputPort=new Serial(pr2, Serial.list()[3], 115200);
    }
  }

  private static Boolean rightPaddleButtonState[]={false, false, false};
  private static Boolean leftPaddleButtonState[]={false, false, false};

  private static Boolean startGame=false;

  public static Boolean startGame() {
    return startGame;
  }

  public static void readInput() {

    var rightInput = rPlayerInputPort.readBytesUntil('\n');
    var leftInput=lPlayerInputPort.readBytesUntil('\n');

    if (rightInput!=null&&rightInput.length>3) {

      rightPaddleButtonState[0]=(rightInput[0]==49);
      rightPaddleButtonState[1]=(rightInput[1]==49);
      rightPaddleButtonState[2]=(rightInput[2]==49);
    }

    if (leftInput!=null&&leftInput.length>3) {
      leftPaddleButtonState[0]=(leftInput[0]==49);
      leftPaddleButtonState[1]=(leftInput[1]==49);
      leftPaddleButtonState[2]=(leftInput[2]==49);
    }

    if (!startGame) {
      startGame=isAllButtonPressed();
    }
  }

  public static Boolean moveUpRightPaddle() {
    return rightPaddleButtonState[0]&&!rightPaddleButtonState[2];
  }

  public static Boolean moveDownRightPaddle() {
    return rightPaddleButtonState[1]&&!rightPaddleButtonState[2];
  }

  public static Boolean moveUpLeftPaddle() {
    return leftPaddleButtonState[0]&&!rightPaddleButtonState[2];
  }

  public static Boolean moveDownLeftPaddle() {
    return leftPaddleButtonState[1]&&!rightPaddleButtonState[2];
  }

  public static Boolean leftPaddleAttack() {
    return leftPaddleButtonState[2];
  }

  public static Boolean rightPaddleAttack() {
    return rightPaddleButtonState[2];
  }

  public static void discard() {
    for (int i=0; i<3; i++) {
      rightPaddleButtonState[i]=false;
      leftPaddleButtonState[i]=false;
    }
  }

  public static Boolean isAllButtonPressed() {
    return rightPaddleButtonState[2]&&rightPaddleButtonState[2];
  }

  static  class Proxy extends PApplet {
  };

  static   Serial rPlayerInputPort;
  static Serial lPlayerInputPort;

  public static Proxy pr1 = new Proxy();
  public static Proxy pr2 = new Proxy();
}
