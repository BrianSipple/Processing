//Desktop Template
Maxim maxim;
AudioPlayer player;
boolean isPlaying = false;


void setup()
{
  size(640, 960);
  background(0);
  maxim = new Maxim(this);
  player = maxim.loadFile("mykbeat.wav");
  player.setLooping(true);

}

void draw()
{
  // Make a start/stop button out of the top half of the screen
  rect(0, 0, width, height/2);

  // create a speed slider -- using a mouseX/width ratio for controlling the speed
  float ratio = (float) mouseX / (float) width;
  ratio *= 2;
  player.speed(ratio);
  
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
  // when the screen is touched/clicked, set the audio back to the start
  player.cue(0);
  player.play();
  
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

