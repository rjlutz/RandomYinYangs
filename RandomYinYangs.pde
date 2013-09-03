float w = 5;          // weight /pull of the curve
int mouseStartX = 0;  // remember where the mouse is whenever it is pressed
int decay = 10;       // coefficient for decay, 0 = max at each frame, 255 = no decay

void setup() {
  size(500, 500);
  background(0, 0, 0, 255);
}

void draw() {
  fill(0, 0, 0, decay);
  rect(0, 0, width, height);
  float d = random(20, 60);
  fill(random(255), random(255), random(255));
  yinyang(random(width), random(height), d);
}

void yinyang(float x, float y, float d) {

  ellipse(x, y, d, d);

  //bottom of yinyang S curve
  float x1=x,    y1=y;
  float x2=x,    y2=y+d/2;
  float cx1=x+w, cy1=y1;
  float cx2=x+w, cy2=y2;
  stroke(0);
  bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);

  //top of yinyang S curve
  //x1,y1,x2,cy1 left unchanged
  y2=y-d/2;
  cx1=x-w; 
  cx2=x-w; cy2=y2;
  stroke(0);
  bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
}

void mousePressed() {
  mouseStartX = mouseX;
}

void mouseReleased() {
  float adjustment = map(mouseX-mouseStartX, 0, width, 0, 10);
  w += adjustment;
  println("w set to: " + w);
}

void mouseDragged() {
  float adjustment = map(mouseX-mouseStartX, 0, width, 0, 10);
  text(w+adjustment, mouseX, mouseY-10);
}

void keyPressed() {
  if (keyCode == UP) 
    decay++;
  else if (keyCode == DOWN) 
    decay--;
  println("decay:"  + decay);
}


