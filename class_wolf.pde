class WOLF{
  int wolf_num=2;
  String[] wolf = {
    "wolf_1.png",
    "wolf_2.png",
  };
  PImage []   wolfImage = new PImage [wolf.length] ;
  PVector [] wolf_location = new PVector[wolf_num];
  int wolfindex;
  
  /*----------SET WOLF-----------*/
  WOLF(int num){ 
    load(wolfImage,wolf);
    wolf_num=num;
    for (int i=0; i<wolf_num; i++){
      wolf_location[i]=new PVector(int (random(-level.x,level.x)),int (random(-level.y,level.y)),10);
    }
  };
  /*----------WOLF MOVE-----------*/
  void wolfmove(int m[]){
       for (int i=0; i<wolf_num; i++){
        wolf_location[i].x-=m[0];
        wolf_location[i].y-=m[1];
      }
  }
  /*----------DAY & NIGHT-----------*/
  void day_night(){
     for (int i=0; i<w.wolf.length; i++){
      w.wolfImage[i].filter(INVERT);
    }
  }
  
  void draw(FloatList bullet_location){
    wolfindex = int(float(frameCount)*0.15)% (wolfImage.length);
    
    for (int i=0; i<wolf_num; i++){
      /*-----WOLF KILL------*/
      int kill=1;
      for (int j=0; j<bullet_location.size(); j=j+2){
        if (bullet_location.get(j)<=wolf_location[i].x + wolfImage[wolfindex].width
        && bullet_location.get(j)>=wolf_location[i].x-wolfImage[wolfindex].width 
        && bullet_location.get(j+1)<=wolf_location[i].y +wolfImage[wolfindex].height 
        && bullet_location.get(j+1)>=wolf_location[i].y -wolfImage[wolfindex].height) 
        {
          bullet_location.remove(j);
          bullet_location.remove(j);
          kill=-20;
          wolf_location[i].z-=1;
        }  
      }
      if (wolf_location[i].z<=0){
          tool_now[2]+=1;
          wolf_location[i].set(int (random(-level.x,level.x)),int (random(-level.y,-level.y)),10);
      }
      
      /*-----BLOOD------*/
      fill(225,0,0);
      noStroke();
      float blood = map(wolf_location[i].z,0, 10, 0 , wolfImage[wolfindex].width);
      rect(wolf_location[i].x-wolfImage[wolfindex].width/2,
      wolf_location[i].y-wolfImage[wolfindex].height/2,
      blood,1);
      /*-----WOLF------*/
      push();
        float angle = atan2(wolf_location[i].y - imgY, wolf_location[i].x - imgX);
        imageMode(CENTER);
        translate(wolf_location[i].x,wolf_location[i].y);
        rotate(angle+1.5);
        if (kill!=1) tint(153, 12, 10, 150);
        image(wolfImage[wolfindex],0, 0);
        rotate(-angle-1.5);
        translate(-wolf_location[i].x,-wolf_location[i].y);
        noTint();
      pop();
      
      /*-----WOLF MOVE------*/
      if (wolf_location[i].x <=imgX+ r.getredimg(r.getredindex()).width 
      && wolf_location[i].x >=imgX- r.getredimg(r.getredindex()).width
      && wolf_location[i].y <=imgY+ r.getredimg(r.getredindex()).height
      && wolf_location[i].y >=imgY- r.getredimg(r.getredindex()).height){
        attack=1;
        tool_now[1]-=1;
      }
      if (wolf_location[i].x<imgX) wolf_location[i].x+=kill;
      if (wolf_location[i].x>imgX) wolf_location[i].x-=kill;
      if (wolf_location[i].y>imgY) wolf_location[i].y-=kill;
      if (wolf_location[i].y<imgY) wolf_location[i].y+=kill;
      
    }
  }

  
}
