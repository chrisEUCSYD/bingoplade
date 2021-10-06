// skal beregne sansynligheden for at det næste tal er "rigtigt" //<>//


import java.util.Arrays;
import java.util.HashSet;

// 2d array
int[][] plade = new int[9][3];

// trukne numre
HashSet<Integer> calledNumbers = new HashSet<Integer>();

// gemmer det sidste trukne tal
int lastCalledNumber ;


void setup() {
  size(1200, 600);
  textSize(30);
  //initiering af mit 2d array med tilfældige værdier.
  // der er 9 colonner. ettere, toere, treere ..... ganger jeg med ti passer det.
  for (int i =0; i<9; i++) {
    plade[i] = generateRow(i);
  }

  // Nul angiver blindt spillefelt. Placere et nyt nul, så længde der ikke er 4 i en række gentag 3 gange
  for (int i =0; i< 3; i++) {
    while (findExistingValue(0, i) < 4) {
      placeZero(i);
    }
  }
}


void draw() {
  background(200);
  // udskriv bingoplade
  drawBingo();
  //udskriver det sidste trukne nummer til skærm 
  drawLastNumber();
  // farv feltet rød hvis jeg har værdien
  for (int i : calledNumbers) {
    findValue(i);
  }
  // sorter mit array så jeg kan udskrive trukne tal i rækkefølge
  sortHash();
  // hvis en række er fyld skrive jeg en besked ud på skærmen
  findRow();
}


void mousePressed() {
  // jeg er nød til at bruge en global variabel ellers kan jeg ikke udskrive værdien
  lastCalledNumber = calledNumber();
}


int[] generateRow(int i) {
  // bruger en hashmap da der ikke kan være dubletter
  // jeg bliver ved med at generere værdier indtil der er 3
  // så sorterer jeg mit hashset og laver det om til et int[] som jeg returnerer

  HashSet<Integer> p = new HashSet<Integer>();
  int[] tempArray = new int[3];

  // bliver ved med at fylde med tilfældige værdier indtil størrelsen er mere end 3
  while (p.size()<3) {
    p.add(int(random(1, 10)+(i*10)));
  }

  // lav om til int[] - array
  int j=0;
  for (Integer i1 : p) {
    tempArray[j] = i1;
    j++;
  }

  // sorter array
  Arrays.sort(tempArray);
  return tempArray;
}

int findExistingValue(int x, int row) {
  int k  =0;
  for (int i =0; i<9; i++) {
    if (plade[i][row]==x)
      k++;
  }
  return k;
}

void findValue(int nummer) {
  // loop igennem 2d array og led efter det sidste trukne nummer hvis den finde farves den rød
  for (int i =0; i<9; i++) {
    for (int j =0; j<3; j++) {
      if (nummer == plade[i][j]) {
        fill(255, 0, 0, 30);
        rectMode(CENTER);
        pushMatrix();
        translate(i*50+100, j*50+50);
        square(25, 25, 50);
        popMatrix();
        rectMode(CORNER);  
        fill(255);
      }
    }
  }
}


void placeZero(int x) {
  plade[int(random(0, 9))][x] = 0;
}

void drawBingo() { // tegner bingopladen
  for (int i =0; i<9; i++) {
    for (int j =0; j<3; j++) {
      if (plade[i][j]==0) {
        rectMode(CENTER);
        pushMatrix();
        translate(i*50+100, j*50+50);
        square(25, 25, 50);
        popMatrix();
        rectMode(CORNER);
      } else {
        pushMatrix();
        translate(i*50+100, j*50+100);
        textAlign(CENTER);
        text(plade[i][j], 25, -15);
        textAlign(LEFT);
        popMatrix();
      }
    }
  }
}

int calledNumber() {
  // generer random tal
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

void drawLastNumber() {
  if (lastCalledNumber != 0) {
    text(lastCalledNumber, 50, 200);
  }
}

void sortHash () {
  int[] callednr = new int[calledNumbers.size()];
  int j =0;

  // h= height, w= width
  int h =0;
  int w =0;
  for (int i : calledNumbers) {

    callednr[j] =i;

    j++;
  }
  Arrays.sort(callednr);

  text("antal trukne tal: "+callednr.length, 50, 250);
  for (int i=0; i<callednr.length; i++) {
    if (h*40+100>width)
    {
      h=0;
      w=w+35;
    }
    text(callednr[i], 50+h*40, 300+w);
    h++;
  }
}

boolean completeRow(int x) {
  int count=0;


  if (calledNumbers.size()>5) {
    for (int i=0; i<9; i++) {
      if (!calledNumbers.contains(plade[i][x])   ) {
      } else
      {
        count++;
      }
    }
  }

  if (count >4)
    return true;
  else
    return false;
}

void findRow() {
  for (int i=0; i<3; i++) {
    if (completeRow(i)) {
      rectMode(CENTER);
      pushMatrix();
      translate(50+600, i*50+50);
      text("You completed row  "+(i+1)+"!!", 25, 25);
      popMatrix();
      rectMode(CORNER);
    }
  }
}
