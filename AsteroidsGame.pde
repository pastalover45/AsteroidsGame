SpaceShip ship;
Star[] starfield;



//your variable declarations here
public void setup() 
{
  //your code here
  size(750,750);
  ship =new SpaceShip();
   
   starfield = new Star[1000];
  for(int i=0; i<1000;i++){
    starfield[i] = new Star();
  }

}


public void draw() 
{
  //your code here
  background(0);
  ship.show();
  ship.move();
  
 for(int i=0; i<1000;i++){
  starfield[i].show();
  starfield[i].move();
  }


}




class SpaceShip extends Floater  
{   
    //your code here
public SpaceShip() {
    
    //corners
    corners = 6;

  //complete the worksheet and change the spaceship shap shaip 
    // int[] xS = {1};
    // int[] yS = {0,-7,17,0,17,7,0}; 
    // xCorners = xS; 
    // yCorners = yS;

corners = 6;
xCorners = new int[corners];
yCorners = new int[corners];
xCorners[0] = 15;
yCorners[0] = 0;
xCorners[1] = 0;
yCorners[1] = -7;
xCorners[2] = -7;
yCorners[2] = -17;
xCorners[3] = -13;
yCorners[3] = 0;
xCorners[4] = -7;
yCorners[4] = 17;
xCorners[5] = 0;
yCorners[5] = 7;


    //color
    myColor = color(255,255,128);
    //myCenter
    myCenterX = 500;
    myCenterY = 375;
    //myDirection
    myPointDirection= 270;
    myDirectionX = 0;
    myDirectionY =0;

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



public void keyPressed(){

  if(key == CODED){
    if(keyCode == UP){ship.accelerate(0.9);}
    if(keyCode == DOWN){ship.accelerate(-0.9);}
    if(keyCode == LEFT){ship.rotate(-5);}
    if(keyCode == RIGHT){ship.rotate(5);}

 }

 if(key == ENTER){ 
  ship.setX((int)((Math.random())*1001)); 
  ship.getX();
  ship.setY((int)((Math.random())*1001));
  ship.getY();

  }
}

public void keyReleased() {

  ship.setDirectionX(0);
  ship.setDirectionY(0);
}





class Star
{
  private double sX,sY,sTheta,sSpeed;
  private int sWH;
 
  public Star(){
    sX=500;
    sY=375;
    sTheta= Math.random()*2*Math.PI;
    sSpeed= 8;
    sWH= 2;

  }

  public void show(){


    noStroke();
    fill(255);
    ellipse((float)sX,(float) sY, sWH, sWH);

  }

  public void move(){

    sX = sX+ Math.cos(sTheta)*sSpeed;
    sY = sY+ Math.sin(sTheta)*sSpeed;
    if(sX>750||sX<0){
      sX=375;
    }
    if(sY>750||sY<0){
      sY=375;
    }
  }
}

//NO TOUCHY TOUCHY
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

