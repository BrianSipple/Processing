

float magnify = 300; // This is how big we want the rose to be.
float rotation = 0; // rotation : this is basically how far round the circle we are going to go
float radius = 0; // radius : this is basically how far from the origin we are.
int elements = 20;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 

float spacing;

void setup() {
  //iPad portrait. Swap the numbers for landscape. 
  size(768,1024);
  rectMode(CENTER);
  colorMode(HSB);
}
 
void draw() {
  background(0);
  radius = map(mouseX, 0, width, 0, 10);  // moving the mouse horizontally will create translations
  rotation = map(mouseY, 0, height, 0, 10);  // moving the mouse vertically will create rotations
  spacing = TWO_PI/elements; // this is how far apart each 'node' will be - TWO_PI is essentially how we compute the size of the circle
  translate(width*0.5,height*0.5);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.
  noFill();
  strokeWeight(2);
  
  // for every element... 
  for (int i = 0; i < elements;i++) {
      stroke(i*2,255,255);     // pick a color...
      pushMatrix();            // push on the animation matrix...
      rotate(spacing*i*rotation);    // rotate based on the distance apart, which element in the system we're on, and the rotation
      translate(sin(spacing*i*radius)*magnify, 0);    // translate on the sin * magnification... think of it as squeezing the radius of the sin waves to and from the center point
      ellipse(0,0,10*i,10*i);   // draw circles based upon the final location of our origin... with sizes computed by the element number
      popMatrix();
  }
}

