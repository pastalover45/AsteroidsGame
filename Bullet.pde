//what am i suppose to do here

class Bullet extends Floater{

private double dRadians; 

public Bullet(SpaceShip ship){

 
  corners=8;
  int[] xS ={0,2,3, 2, 0,-2,-3,-2};
  int[] xY ={3,2,0,-2,-3,-2, 0, 2};
  xCorners = xS;
  yCorners = xY;

//is this color too neon, does it even look like bullets
  myColor = color(153,255,204);

  myCenterX = ship.getX();
  myCenterY = ship.getY();
    
  myPointDirection =ship.getPointDirection();
  double dRadians =myPointDirection*(Math.PI/180);

  myDirectionX = (5 *Math.cos(dRadians)) + ship.getDirectionX();
  myDirectionY = (5 *Math.sin(dRadians)) + ship.getDirectionY();

//AsteroidsGame.Floater.getX()
  }

public void show () 
   { 

   
    noStroke();
    fill(myColor);            
    ellipse((int)myCenterX,(int)myCenterY, 8,8);
    
   }  

  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 


}