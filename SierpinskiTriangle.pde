
public void setup()
{
  size(800, 700);
  noLoop();
}
int len = 500;
public void draw()
{

  if(isPressingN) {
    len+=20;
    //if(len>1000) len+=((len/100)*zoomBoost)*len%1000;
    //System.out.println(len + ", increasing");
  }
  
  if(isPressingM && len>=1){ 
    len-=20;
    //if(len>1000) len-=((len/100)*zoomBoost)*len%1000;
   // System.out.println(len+ ", decreasing");
  }
  background(100,100,100);
  fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  //int len = (int)(Math.random()*100);
  
  ellipse(width/2,height/2,10,10);
  //triangle(width/2-150,height/2+150,width/2+150,height/2+150,width/2,height/2-150);
  fill(255);
  sierpinski(width/2-len/2,height/2+len/2,len);


  //delay(1000);
}
public void mouseDragged()//optional
{
}
boolean isPressingN = false;
boolean isPressingM = false;

public void keyReleased(){
  noLoop();
  if(key == 'n' || key == 'N'){
    isPressingN = false;
  }
  if(key == 'm' || key == 'M'){
    isPressingM = false;
  }
}
public void keyPressed() {
  loop();
  if (key == 'n' || key == 'n') {
    len+=10;
    isPressingN = true;
    isPressingM = false;
  }
  if ((key == 'm' || key == 'm') && len >= 1){
    len-=10;
    isPressingN = false;
    isPressingM = true;
  }
}
  
public void sierpinski(int x, int y, int len) 
{
  if(len <= 20){//affects the size of triangles
    triangle(x,y,x+len,y,x+len/2,y-len);
  
  }else{
    sierpinski(x,y,len/2);
    sierpinski(x+len/2,y,len/2);
    sierpinski(x+len/4,y-len/2,len/2);
  }
}
