//Desktop Template
Maxim maxim;
AudioPlayer player;
boolean isPlaying;

void setup()
{
  size(640, 960);
  background(0);
  maxim = new Maxim(this);
  player = maxim.loadFile("mykbeat.wav");
  player.setLooping(true);
  isPlaying = false;

}

void draw()
{
  if (isPlaying) {
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  // Make a start/stop button out of the top half of the screen
  rect(0, 0, width, height/2);

  // create a speed slider -- using a mouseX/width ratio for controlling the speed
  // ... only do this when the user touches in the bottom-half of the screen
  float ratio = 0;
  if (mouseY > height/2) {
      ratio = (float) mouseX / (float) width;
      ratio *= 2;
      player.speed(ratio);
  }
  
  fill(ratio * 128);
  rect(0, height/2, width, height/2);  // starting position x, y... followed dimensions for width and height

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
  
  // toggle play button has been pressed... we'll handle the sound accordingly
  if (mouseY < height/2) {
    if (isPlaying) {
      player.stop();
    } else {
      player.play();
    }
    isPlaying = !isPlaying;
  }
  
}

void mouseReleased()
{
  // code that happens when the mouse button
  // is released
}

