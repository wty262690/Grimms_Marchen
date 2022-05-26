int attack=0;

void gamewindow(){
   /*----------
    DIE 
    -----------*/
   if (tool_now[1]<=0){
      diecount=0;
      statue=2;
      return;
   }
  
  /*----------
  MOVE
  -----------*/
  if (keyPressed == true) {
    //print(imgX,imgY," || ");
    int [] m={0,0};
    if (keyCode == UP) if (move.y>0) m[1]-=movespace;
    if (keyCode == DOWN) if (move.y<bgimg.height-H) m[1]+=movespace;
    if (keyCode == LEFT)  if (move.x>0)  m[0]-=movespace;
    if (keyCode == RIGHT)  if (move.x<bgimg.width-W)  m[0]+=movespace;
      
    move.x+=m[0];
    move.y+=m[1];
    w.wolfmove(m);
    t.toolmove(m);
  }
  
  /*----------
  BACKGROUND
  -----------*/
  if (frameCount==500 || frameCount==0) {
    /*-----DAY & NIGHT------*/
    w.day_night();
    bgimg.filter(INVERT); 
  }
  if (frameCount==1000) frameCount=0; 
  copy(bgimg,int(move.x) ,int(move.y),int(W),int(H),0,0,int(W),int(H));
  
  /*----------
  CLIAM
  -----------*/
  imgX=W2;
  imgY=H-r.getredimg(r.getredindex()).height*0.7;
  attack=0;
  
  
  /*----------TOOL-----------*/
  t.draw();
  /*----------BULLET-----------*/
  bu.draw();
  /*----------WOLF-----------*/
  w.draw(bu.getlocation());
  /*----------RED-----------*/
  r.draw();
  
  /*----------
  MASK
  -----------*/
  push();
    imageMode(CENTER);
    copy(maskimg,int(move.x),int(move.y),int(W),int(H),0,0,int(W),int(H));
  pop();
  image(blackmask,0,0);
  
  /*----------
  STATUE 
  -----------*/
  drawtext();
  t.drawweapon();
}

/*----------
DRAW STATUE 
-----------*/
void drawtext(){
  
  push();
    fill(225,225,225,50);
    rect(10,10,200,100);
  pop();
  
  push();
    textSize(20);
    fill(255);
    text("HP:"+tool_now[1],15,30);
    text("BULLET:"+tool_now[0],15,60);
    text("KILLED:"+tool_now[2],15,90);
  pop();
}


  /*----------
  MOUSE
  -----------*/
  void mousePressed(){
      if(statue==1){
        if (mouseButton == RIGHT){
          int perindex=r.getredindex();
          while(true){
            r.setredindex((r.getredindex()+1)%r.redImage.length);
            bu.setkind((bu.getkind()+1)%bu.bulletImage.length);
            if (weapon_now[bu.getkind()]>0)break;
            if(r.getredindex()==perindex) break;
          }
        }
        else if (mouseButton == LEFT)bu.shoot();
      }
  }
