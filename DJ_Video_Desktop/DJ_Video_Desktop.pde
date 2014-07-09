//Desktop Template
Maxim maxim;
boolean isPlaying = false;


void setup()
{
  size(640, 960);

  background(0);
}

void draw()
{
  // Make a start/stop button out of the top half of the screen

  rect(0, 0, width, height/2);
  
  if (isPlaying) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
}

void mouseDragged()
{
  // code that happens when the mouse moves
  // with the button down
}

void mousePressed()
{
  // toggle play button has been pressed
  if (mouseY < height/2) {
    isPlaying = !isPlaying;
  }
  
}

void mouseReleased()
{
  // code that happens when the mouse button
  // is released
}

