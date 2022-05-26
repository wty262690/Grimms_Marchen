String [] buttom={
  "continue",
  "restart",
  "exit"
};
float stopcount=0;
void stopwindow(){
  if (stopcount<2*H)  stopcount+=20;
  background(stopimage);
  float fx=W2, fy=H/5;
  push();
    fill(225,80);
    rectMode(CENTER);
    rect(W2,0,W/3,stopcount);
  pop();
  push();  
    fill(#FAE600); 
    textAlign(CENTER,CENTER);
    for (int i=0; i<buttom.length; i++){
      textSize(50);
      if (mouseX<fx+fw/2 && mouseX>fx-fw/2 && mouseY<fy+blocky*i+fh && mouseY>fy+blocky*i){
        textSize(60);
        if (mousePressed==true){
          switch(i){
            case(0): statue=1;break;
            case(1): restart(); statue=0;break;
            case(2): exit(); break;
            default: break;
            
          }
        }
      }
      text(buttom[i],fx,fy+blocky*i);
    }
  pop();
}
