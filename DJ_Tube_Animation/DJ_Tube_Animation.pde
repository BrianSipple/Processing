// an array of images to store the main video animation
PImage[] images;

// an array of image to store the record players
PImage[] recordPlayer;

// the TV
PImage TV;

// the current position within the animation
float currentFrame = 0;

// positioning variables for the record player icons
int deck1x, deck1y, deck2x, deck2y;

// positioning variables for the tv 
int tvx, tvy;

int animx, animy;

boolean deck1Playing = false;
boolean deck2Playing = false;
float rotateDeck1 = 0;
float rotateDeck2 = 0;
int margin = width/40;
AudioPlayer player1;
AudioPlayer player2;
Maxim maxim;
float speedAdjust = 1.0;


void setup()
{
    // Set the screen size
    size(768, 1024);
    
    // load the images
    // They need to be named the form:
    // Animation_data/movieX.jpg
    // where X is a number that says where
    // the image is in the sequence
    // The first parameter is the filename up to the number
    // the second is the file extension
    // the third is the number of the last image
    images = loadImages("Animation_data/movie", ".jpg", 134);
    imageMode(CENTER);
    recordPlayer = loadImages("black-record_", ".png", 36);
    TV = loadImage("TV.png");
    maxim = new Maxim(this);
    player1 = maxim.loadFile("beat1.wav");
    player1.setLooping(true);
    player2 = maxim.loadFile("beat2.wav");
    player2.setLooping(true);
    background(10);
}

void draw()
{
  background(10);
  imageMode(CENTER);
  // draw the current images from our arrays (and the TV!)
  image(images[(int)currentFrame], width/2, images[0].height/2 +margin, images[0].width, images[0].height);
  image(TV, width/2, TV.height/2+margin, TV.width, TV.height);
  
  // compute how we want the record player wheels positioned
  deck1x = (width/2) - recordPlayer[0].width/2-(margin*10); // move the center to the left of the middle by the radius length and our margin
  deck1y = TV.height + recordPlayer[0].height/2+margin;
  image(recordPlayer[(int) rotateDeck1], deck1x, deck1y, recordPlayer[0].width, recordPlayer[0].height); 
  deck2x = (width/2) + recordPlayer[0].width/2 + (margin*10);
  deck2y = TV.height + recordPlayer[0].height/2 + margin;
  image(recordPlayer[(int) rotateDeck2], deck2x, deck2y, recordPlayer[0].width, recordPlayer[0].height);
  
  // Setting player2's speed to be dependent on the ratio of its length
  // to player1's length ensures that the two are kept in sync. 
  if (deck1Playing || deck2Playing) {
    player1.speed(speedAdjust);
    player2.speed( (player2.getLengthMs() / player1.getLengthMs()) * speedAdjust);
    currentFrame = currentFrame + 1 * speedAdjust; //advnace the frame relative to the speedAdust
  }
  
  // ensure that our frames loops
  if (currentFrame >= images.length) {
    currentFrame = 0;
  }
    
  
  if (deck1Playing) {
    
    rotateDeck1 += 1*speedAdjust;
    
    if (rotateDeck1 >= recordPlayer.length) {
      rotateDeck1 = 0;
    }
  }
  
    if (deck1Playing) {
    
    rotateDeck2 += 1*speedAdjust;
    
    if (rotateDeck2 >= recordPlayer.length) {
      rotateDeck2 = 0;
    }
  }
  
}

void mouseClicked() {
  
  // If the distance of the touch from the center of the record image 
  // is less than the recrodPlayer width, it must be a touch
  if (dist(mouseX, mouseY, deck1x, deck1y) < recordPlayer[0].width) {
    deck1Playing = !deck1Playing;
  }
  
  if (deck1Playing) {
    player1.play();
  } else {
    player1.stop();
  }
  
  
  if (dist(mouseX, mouseY, deck2x, deck2y) < recordPlayer[0].width) {
    deck2Playing = !deck2Playing;
  }
  
  if (deck2Playing) {
    player2.play();
  } else {
    player2.stop();
  }
  
}

void mouseDragged() {
  
  if (mouseY > height/2) {
    speedAdjust = map(mouseX, 0, width, 0, 2);
  }
  
}



