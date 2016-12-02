SpaceShip ship;
Star[] starfield;
ArrayList<Asteroid> someAsteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullet = new ArrayList<Bullet>();
boolean getsHit = false;

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

  for (int i= 0; i<(int)(Math.random()*10+10); i++) {

    someAsteroids.add(new Asteroid());
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

  for(int i=0; i<someAsteroids.size();i++){
    someAsteroids.get(i).show();
    someAsteroids.get(i).move();
      
}
 for(int l=0;l<someAsteroids.size();l++){
    if(dist(someAsteroids.get(l).getX(),someAsteroids.get(l).getY(),ship.getX(),ship.getY())<12){
     someAsteroids.remove(l);
     getsHit=true;
    }

} 


  for(int a=0; a<bullet.size();a++){
    bullet.get(a).show();
    bullet.get(a).move();

    if(bullet.get(a).getX()>750||bullet.get(a).getX()<0){
      bullet.remove(a);
    }

    if(bullet.get(a).getY()>750||bullet.get(a).getY()<0){
      bullet.remove(a);
    }

for(int i=0;i<someAsteroids.size();i++){
      if(dist(someAsteroids.get(i).getX(),someAsteroids.get(i).getY(),bullet.get(a).getX(),bullet.get(a).getY())<10){
      someAsteroids.remove(i);
      break;  

}
      }
    }
}


class SpaceShip extends Floater  
{   
    //your code here
public SpaceShip() {
    
    //corners
    corners = 6;

  //complete the worksheet and change the spaceship shap shaip 

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
   // myColor = color(255,0,0);
    //myColor = color(255,255,128);
    myColor= color(30,144,255);
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
  //random location
  ship.setX((int)((Math.random())*1000)); 
  ship.getX();
  ship.setY((int)((Math.random())*1000));
  ship.getY();
  //random direction
  ship.setPointDirection((int)((Math.random())*360)); 

  }
  
  if(key == ' '){
    bullet.add(new Bullet(ship));
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





class Asteroid extends Floater{

  private int asterRotation;
  public Asteroid(){

    corners=12;
    //change this according to graph paper
    int[] xS ={15,9,0,-5,-10,-14,-15,-10,-6,-1,9,14};
    int[] xY ={0,7,10,9,6,2,-4,-7,-9,-10,-10,-5};
    xCorners = xS;
    yCorners = xY;

    myColor = color(128,128,128);

    myCenterX =500;
    myCenterY =375;
    if(Math.random()<0.25){
      myCenterX = Math.random()*300;  
    }

    else if(Math.random()<0.5){
      myCenterX = Math.random()*300+700;   
    }
    else if(Math.random()<0.75){
      myCenterY = Math.random()*150;
    }
        
    else if (Math.random()<1){
      myCenterY = Math.random()*150+650;
    }
   
    myPointDirection =0;
    myDirectionX = Math.random()*6-3;
    myDirectionY = Math.random()*6-3;

    asterRotation = (int)(Math.random()*18)-7;

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

  public void move(){

    rotate(asterRotation);
    super.move();
      
    }
}







class Bullet extends Floater{

private double dRadians; 

public Bullet(SpaceShip ship){

 
  corners=8;
  int[] xS ={0,2,3, 2, 0,-2,-3,-2};
  int[] xY ={3,2,0,-2,-3,-2, 0, 2};
  xCorners = xS;
  yCorners = xY;

  myColor = color(255,0,0);

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
    
   //fill(240,255,255,50);
   // ellipse((int)myCenterX,(int)myCenterY,15,15);
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


//}
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

