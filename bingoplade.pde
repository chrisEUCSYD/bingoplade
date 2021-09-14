// 2d array 
int[][] plade = new int[9][3];

void setup() {
  size(600, 600);

  
  //initiering af mit 2d array med tilfældige værdier.
  // der er 9 colonner. ettere, toere, treere ..... ganger jeg med ti passer det.  
  for (int i =0; i<9; i++) {
    for (int j =0; j<3; j++) {
      plade[i][j] = int(random(1,10)+i*10);
// sort
    if (j >0 && plade[i][j-1] > plade[i][j]  && j<3){
      int temp = plade[i][j-1];
      plade[i][j-1] = plade[i][j];
      plade[i][j] = temp;
    }

    }
    
    
    
    
    // søg dubletter
         
  }
}


void draw() {
  for (int i =0; i<9; i++) {
    for (int j =0; j<3; j++) {
      text(plade[i][j],(i+1)*20, (j+1)*20);
    }
  }
}
