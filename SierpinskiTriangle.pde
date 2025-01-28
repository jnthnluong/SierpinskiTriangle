public void setup()
{
  size(800, 700);
  noLoop();
}
public void draw()
{
  //background(100,100,100);
  fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  //int len = (int)(Math.random()*100);
  int len = 500;
  ellipse(width/2,height/2,10,10);
  //triangle(width/2-150,height/2+150,width/2+150,height/2+150,width/2,height/2-150);
  sierpinski(width/2-len/2,height/2+len/2,len);
  //delay(1000);
}
public void mouseDragged()//optional
{
}
public void sierpinski(int x, int y, int len) 
{
  if(len <= 100){//affects the size of triangles
    triangle(x,y,x+len,y,x+len/2,y-len);
  }else{
    sierpinski(x,y,len/2);
    sierpinski(x+len/2,y,len/2);
    sierpinski(x+len/4,y-len/2,len/2);
  }
}
