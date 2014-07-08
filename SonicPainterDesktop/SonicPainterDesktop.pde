import java.util.Random;


Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;

int startTime = 0;
int timeSinceStart = 0;

Random rand = new Random();

void setup()
{
  size(640, 960);
  maxim = new Maxim(this);
  player = maxim.loadFile("atmos1.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("bells.wav");
  player2.setLooping(true);
  player3 = maxim.loadFile("plasma-rifle-round.wav");
  player3.setLooping(false);  // we'll start this programatically
  
  player.volume(0.25);
  background(0);
  rectMode(CENTER);

}

void draw()
{
//  
}

void mouseDragged()
{
  player.play();
  player2.play();
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  //println(alpha);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
  //rect(mouseX, mouseY, speed, speed);
  line(pmouseX, pmouseY,mouseX, mouseY);
  line(width/2 + ((width/2) - pmouseX), pmouseY, width/2 + ((width/2) - mouseX), mouseY);
  brush1(mouseX, mouseY,speed, speed,lineWidth);
  //brush2(mouseX, mouseY,speed, speed,lineWidth);
  //brush3(mouseX, mouseY,speed, speed,lineWidth);
  //brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);

  //brush5(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  //brush6(mouseX, mouseY,speed, speed,lineWidth);
  //brush7(pmouseX, pmouseY,mouseX, mouseY,lineWidth);

  player.setFilter((float) mouseY/height*5000,mouseX / width);
  //player2.setFilter((float) mouseY/height*5000,mouseX / width);
  
  player2.ramp(1.,1000);
  player2.speed((float) mouseX/width/2);
  
  trackTime();
  if (timeSinceStart > 6000) { 
      plasmaBurst(mouseX, mouseY, pmouseX, pmouseY, speed, lineWidth);
      resetTimer();
  }
  
}

void plasmaBurst(float mouseX, float mouseY, float pmouseX, 
                 float pmouseY, float speed, float lineWidth) {
  player3.play();
  int randNum = rand.nextInt(7) + 1;
  brushSelect(randNum, mouseX, mouseY, pmouseX, pmouseY, speed, lineWidth);
  line(0, 0, width, height);
  line(width, 0, 0, height);
 
}

void resetTimer() {
      startTime = millis();  
}

void trackTime() {
      timeSinceStart = millis() - startTime;
}

void brushSelect(int brush, float mouseX, float mouseY, float pmouseX, 
                 float pmouseY, float speed, float lineWidth) {
  switch(brush) {
    case 1:
      brush1(mouseX, mouseY,speed, speed,lineWidth);
      break;
    case 2:
      brush2(mouseX, mouseY,speed, speed,lineWidth);
      break;
    case 3:
      brush3(mouseX, mouseY,speed, speed,lineWidth);
      break;
    case 4:
      brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
      break;
    case 5:
      brush5(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
      break;
    case 6:
      brush6(mouseX, mouseY,speed, speed,lineWidth);
      break;
    case 7:
      brush7(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
      break;      
  }
}

void mouseReleased()
{
  //println("rel");
  player2.ramp(0.,1000);    
}



