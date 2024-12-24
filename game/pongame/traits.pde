static class Traits{
  public interface Drawable{
    public void draw();
  }
  public interface Animatable{
    public void update();
  }
  
  public interface Object extends Drawable,Animatable{};
}
