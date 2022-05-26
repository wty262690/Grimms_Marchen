int diecount=-100;
void diewindow(){
  if (frameCount%5==1) diecount++;
  background(0);
  push();
    fill(startcolor);
    textSize(50);
    textAlign(CENTER,CENTER);
    text("GAME OVER",W2,H/3);
    textSize(40);
    if (diecount<0)    text("Killed: 0",W2,H2);
    else if (diecount>tool_now[2])    text("Killed: "+tool_now[2],W2,H2);
    else text("Killed: "+diecount,W2,H2);
    
    if (diecount>=tool_now[2]){
      if (mouseX>W2-50 && mouseX<W2+50 && mouseY>H2*1.5 && mouseY<H2*1.5+35) {
        textSize(60);
        if (mousePressed==true)  {
          //changeanimate();
          restart(); statue=0;
        }
      }
      color c=color(red(startcolor),green(startcolor),blue(startcolor),diecount*10);
      fill(c);
      text("restart",W2,H2*1.5);
    }
  pop();
  
}
