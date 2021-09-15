import java.util.Arrays; //<>//
import java.util.HashSet;

// 2d array
int[][] plade = new int[9][3];
// trukne numre
HashSet<Integer> calledNumbers = new HashSet<Integer>();
int lastCalledNumber ;


void setup() {
  size(600, 600);
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
  drawBingo();
  drawLastNumber();
  findValue(lastCalledNumber);
  
  
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

  // flyder med tilfældige værdier
  while (p.size()<3) {
    p.add(int(random(1, 10)+(i*10)));
  }

  // lav om til int[]
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

void findValue(int x) {

  for (int i =0; i<9; i++) {
    for (int j =0; j<3; j++) {
      // if (plade[i][j]==x ) {
      if (calledNumbers.contains(plade[i][j])){
        fill(255,0,0);
        square((i+1)*45, j*40+20, 30);
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
      if (plade[i][j]==0)
        square((i+1)*45, j*40+20, 30);
      else
        text(plade[i][j], (i+1)*45, (j+1)*40);
    }
  }
}


int calledNumber() {
  // generer random tal
  int i = int(random(1, 99));
  // bliv ved med at generere indtil det ikke findes i hashset
  while (calledNumbers.contains(i)) {
    i=int(random(1, 99));
  }
  // nu ved vi at det ikke findes i forvejen så derfor kan vi tilføje
  calledNumbers.add(i);
  printArray(calledNumbers);
  // retuner det fundne tal
  return i;
}

void drawLastNumber() {
 if (lastCalledNumber != 0){
  text(lastCalledNumber, 50, 200);
 }
}

void sortHash (){
  for (int i : calledNumbers) {
  System.out.println(i);
}
}
