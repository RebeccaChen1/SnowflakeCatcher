import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SnowflakeCatcher extends PApplet {

SnowFlake [] snow;
public void setup()
{
  size(400,400);
  background(0);
  noStroke();
  snow=new SnowFlake[100];
  for(int i=0; i<snow.length; i++)
  {
    snow[i]=new SnowFlake();
  }
}
public void draw()
{
  for(int i=0; i<snow.length;i++)
  {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
}
public void mouseDragged()
{
  if(mouseButton==LEFT)
  {
   fill(255,0,0);
   ellipse(mouseX,mouseY,10,10);
  }
  else
  {
    fill(0);
    ellipse(mouseX,mouseY,10,10);
  }


}



class SnowFlake
{
  int x;
  int y;
  int myColor;
  boolean isMoving;

  SnowFlake()
  {
    x=(int)(Math.random()*400);
    y=(int)(Math.random()*400);
    myColor=color(255,255,255);
    isMoving=true;
  }
  public void show()
  {
    fill(myColor);
    ellipse(x,y,10,10);
  }
  public void lookDown()
  {
    if(get(x+2,y+5) !=color(0,0,0))
    {
      isMoving=false;
    }
    else if(get(x-2,y+5) !=color(0,0,0))
    {
      isMoving=false;
    }
    else
    {
      isMoving=true;
    }
  }

  public void erase()
  {
    fill(0);
    ellipse(x,y,12,12);
  }
  public void move()
  {
    if(isMoving==true)
    {
      y++;
    }
  }
  public void wrap()
  {
    if(y>390)
    {
      y=0;
      x=(int)(Math.random()*400);
    }
  }
}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SnowflakeCatcher" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
