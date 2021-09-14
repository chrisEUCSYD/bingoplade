int[][] plade = new int[9][3];

void setup() {
  size(600, 600);

  for (int i =0; i<9; i++) {
    for (int j =0; j<3; j++) {
      
      if(i<1){
      plade[i][j] = int(random(1,10));
      }
      else
      {
      plade[i][j] = int(random(1,10)+i*10);
      }
      println(10*(i+1), 10*(i+1));
    }
  }
}


void draw() {
  for (int i =0; i<9; i++) {
    for (int j =0; j<3; j++) {
      text(plade[i][j],(i+1)*20, (j+1)*20);
    }
  }
}
