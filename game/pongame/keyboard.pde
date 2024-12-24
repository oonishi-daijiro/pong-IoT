
void keyPressed(){
  if(key<255){
    Keyboard.keys[key]=true;
  }
}

void keyReleased(){
  if(key<255){
    Keyboard.keys[key]=false;
  }
  
}

public static class Keyboard{
  public static boolean keys[]=new boolean[255];
  
  public static boolean isPressed(int code){
    return keys[code];
  }
};
