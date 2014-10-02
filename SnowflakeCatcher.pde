int aColor=color(255,255,255);

SnowFlake [] snow;
Runner bob;
void setup()
{
  frameRate(40);
  size(405,405);
  background(0);
  noStroke();
  bob=new Runner();
  snow=new SnowFlake[100];
  for(int i=0; i<snow.length; i++)
  {
    if(i%7==0)
    {
      snow[i]=new SnowFlake(color(0,255,0));
    }
    else if(i%8==0)
    {
      snow[i]=new SnowFlake(color(255,0,0));
    }
    else if (i%9==0)
    {
      snow[i]=new SnowFlake(color(0,0,255));
    }
    else 
    {
      snow[i]=new SnowFlake(color(255,255,255));
    }
  }
}
void draw()
{
  bob.check();
  bob.show();
  bob.change();
  bob.move();
  for(int i=0; i<snow.length;i++)
  {
    if(i%100==0)
    {
      fill(0,255,0);
    }
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
}
void mouseDragged()
{
  if(mouseButton==LEFT)
  {
   fill(255,0,0);
   ellipse(mouseX,mouseY,10,10);
  }
  else
  {
    fill(0);
    ellipse(mouseX,mouseY,30,30);
  }


}

class SnowFlake
{
  int x;
  int y;
  int myColor;
  boolean isMoving;

  SnowFlake(int aColor)
  {
    x=(int)(Math.random()*385+15);
    y=(int)(Math.random()*400);
    myColor=aColor;
    isMoving=true;
  }
  void show()
  {
    fill(myColor);
    ellipse(x,y,10,10);
  }
  void lookDown()
  {
    if(get(x+3,y+5) !=color(0,0,0))
    {
      isMoving=false;
    }
    else if(get(x-3,y+5) !=color(0,0,0))
    {
      isMoving=false;
    }
    else
    {
      isMoving=true;
    }
  }

  void erase()
  {
    fill(0);
    ellipse(x,y,12,12);
  }
  void move()
  {
    if(isMoving==true)
    {
      y++;
    }
  }
  void wrap()
  {
    if(y>399)
    {
      y=0;
      x=(int)(Math.random()*400);
    }
  }
}
class Runner
{  
  int myX;
  int myY;
  int colorx;
  int colory;
  int colorz;
  int direction;
  float size;
  boolean isMoving;
  Runner()
  {
    myX=(int)(Math.random()*400);
    myY=(int)(Math.random()*400);
    direction=(int)(Math.random()*4+1);
    isMoving=true;
    size=8.0;
    colorx=100;
    colory=100;
    colorz=100;
  }
  void show()
  {
    fill(colorx,colory,colorz);
    ellipse(myX,myY,size,size);
  }
  void move()
  { 
  if (key==CODED && isMoving==true)
  {
    if (keyCode==UP)
    {
     myY=myY-2;
     if(myY<0)
     {
       myY=405;
     }
    }
    if (keyCode==DOWN)
    {
      myY=myY+2;
      if(myY>405)
      {
        myY=0;
      }
    }
    if (keyCode==RIGHT)
    {
      myX=myX+2;
      if(myX>405)
      {
        myX=0;
      }
    }
    if (keyCode==LEFT)
    {
      myX=myX-2;
      if(myX<0)
      {
        myX=405;
      }
    }
  }
  }
  void check()
  {
    if(get(myX+4,myY)==color(255,255,255) || get(myX,myY-4)==color(255,255,255))
    {
      isMoving=false;
      fill(0);
      rect(0,0,405,405);
      myX=(int)(Math.random()*400);
      myY=(int)(Math.random()*400);
      colorx=100;
      colory=100;
      colorz=100;
      isMoving=true;
    }     
  }
  void change()
  {
    if(get(myX+4,myY)==color(0,255,0) || get(myX,myY-4)==color(0,255,0))
    {
      colory=colory+25;
    }
    else if(get(myX+4,myY)==color(255,0,0) || get(myX,myY-4)==color(255,0,0))
    {
      colorx=colorx+25;
    }
    else if(get(myX+4,myY)==color(0,0,255) || get(myX,myY-4)==color(0,0,255))
    {
      colorz=colorz+25;
    }
  }
}
