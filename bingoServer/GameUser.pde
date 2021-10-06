class GameUser{

  String name;
  String nickName;
  int[][] plade = new int[9][3];
  
  GameUser(String n, String nn){
    name=n;
    nickName = nn;
    //plade = p;
  }
  
  void printUserInfo(){
    println(name);
    println(nickName);
  }

}
