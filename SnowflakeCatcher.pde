SnowFlake [] snow;
void setup()
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
void draw()
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

  SnowFlake()
  {
    x=(int)(Math.random()*400);
    y=(int)(Math.random()*400);
    myColor=color(255,255,255);
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
    if(y>390)
    {
      y=0;
      x=(int)(Math.random()*400);
    }
  }
}
