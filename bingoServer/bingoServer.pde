import processing.net.*;
import java.util.HashSet;

HashSet<Integer> calledNumbers = new HashSet<Integer>();

GameUser[] players = new GameUser[1];

int n=0;

Server myServer;

int val = 0;
boolean isPressed = false;

void setup() {
  size(200, 200);
  textSize(28);
  // Starts a myServer on port 5204
  myServer = new Server(this, 5204);
}

void draw() {
  // Get the next available client
  Client thisClient = myServer.available();
  // If the client is not null, and says something, display what it said
  if (thisClient !=null) {
    String whatClientSaid = thisClient.readString();
    if (whatClientSaid!= null) {
      println(thisClient.ip() + "\t" + whatClientSaid);
      String[] list = split(whatClientSaid, ',');
      players[0] = new GameUser(list[0],list[1]);
      players[0].printUserInfo();
    } 
  } 
  

  val = (val + 1) % 255;
  background(val);
  fill((255-val) % 255);
  //println(calledNumbers.size());
  //printArray(calledNumbers);

   if (keyPressed || isPressed) {
     isPressed=true;
    if (frameCount % 20 == 0 )
    {  
      n = calledNumber();
      myServer.write(n);
    }
    text(n, 100, 100);
  }
}


int calledNumber() {
  // Træk et tilfældigt tal. Findes det så træk et nyt
  int i = int(random(1, 91));
  // bliv ved med at generere indtil det ikke findes i hashset
  while (calledNumbers.contains(i)) {
    i=int(random(1, 91));
  }
  // nu ved vi at det ikke findes i forvejen så derfor kan vi tilføje
  calledNumbers.add(i);

  // retuner det fundne tal
  return i;
}
