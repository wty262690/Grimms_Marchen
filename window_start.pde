color startcolor=color(255);
void startwindow(){
  background(0);
  push();
    fill(startcolor);
    textSize(50);
    textAlign(CENTER,CENTER);
    text("Grimms Märchen",W2,H/3);
    if (mouseX>W2-50 && mouseX<W2+50 && mouseY>H2 && mouseY<H2+35) {
      textSize(60);
      if (mousePressed==true)  {
        //startanimate();
        statue=1; frameCount=0;
      }
    }
    text("start",W2,H2);
  pop();
}

void restart(){
  int [] old_tool_now={100,1000,0}; // bullet=1000, med=10,killed=0, gun1=0, gun2=0;
  int [] old_weapon_now={1,0,0};// gun1=0, gun2=0;
  tool_now=old_tool_now;
  weapon_now=old_weapon_now;
  bgimg=loadImage("/image/map.png");
  startcolor=color(255,0,0);
  frameCount=0;
  
  /*----------SET BULLET-----------*/
  bu= new BULLET();
  /*----------SET WOLF-----------*/
  w=new WOLF(wolf_num);
  /*----------SET RED-----------*/
  r=new RED();  
  /*----------SET TOOL-----------*/
  t=new TOOL();
  
  move= new PVector(int(bgimg.width/2-W2),int(bgimg.height-H));
  statue=0;
}

void startanimate(){
  int s=second();
  while(true){
    println(second()-s);
    if (second()-s>3) break;
    //background(0,100);
  }
  //println("wwwww");
}
