
public void setup()
{
  size(800, 700);
  fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)); 
  //noLoop();
}
int len = 500;
int xOffset = 0;
int yOffset = 0;
public void draw()
{

  //xOffset = mouseX;
  //yOffset = mouseY;
  translate(xOffset, yOffset);

  if (isPressingN) {
    len+=20;
    if (len>2000) {
      for (int i = 1; i <= len/200; i++) {
        len+=20;  
      }
    }

    //System.out.println(len + ", increasing");
  }

  if (isPressingM && len>=1) { 
    len-=20; 
    if (len>2000) {
      for (int i = 1; i <= len/200; i++) {
        len-=20;
      }
    }


    //System.out.println(len+ ", decreasing");
  }
  background(100, 100, 100); 
 
  //int len = (int)(Math.random()*100);

  ellipse(width/2, height/2, 10, 10); 
  //triangle(width/2-150,height/2+150,width/2+150,height/2+150,width/2,height/2-150);
  fill(255); 
  sierpinski(width/2-len/2, height/2+len/2, len); 


  //delay(1000);
  translate(-xOffset, -yOffset);
}
public void mouseDragged()//optional
{
  //System.out.println("moved"); 
  int addX = 0; 
  //idk whats going on anymore
  if (mouseX < pmouseX && mouseX > 0) {
    addX = addX - (pmouseX/mouseX+5);
  }
  if (pmouseX < mouseX && pmouseX > 0) {
    addX = addX + mouseX/pmouseX+5;
  }
  xOffset += addX; 


  int addY = 0; 

  if (mouseY < pmouseY && mouseY>0) {
    addY = addY - (pmouseY/mouseY+5);
  }
  if (pmouseY < mouseY && pmouseY>0) {
    addY = addY + mouseY/pmouseY+5;
  }
  yOffset += addY;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount(); 
  if (e < 0) len+=20; 
  if (e > 0) len-=20;
}
boolean isPressingN = false; 
boolean isPressingM = false; 

public void keyReleased() {

  if (key == 'n' || key == 'N') {
    isPressingN = false;
  }
  if (key == 'm' || key == 'M') {
    isPressingM = false;
  }
}
public void keyPressed() {

  if (key == 'n' || key == 'n') {
    len+=10; 
    isPressingN = true; 
    isPressingM = false;
  }
  if ((key == 'm' || key == 'm') && len >= 1) {
    len-=10; 
    isPressingN = false; 
    isPressingM = true;
  }
}

public void sierpinski(int x, int y, int len) 
{
  if (len <= 20) {//affects the size of triangles
    triangle(x, y, x+len, y, x+len/2, y-len);
  } else {
    sierpinski(x, y, len/2); 
    sierpinski(x+len/2, y, len/2); 
    sierpinski(x+len/4, y-len/2, len/2);
  }
}
