class TOOL{
  int [] tool_num={2,1,0,1,1}; // bullet_num=2, med_num=1, gun0=0, gun1=1, gun2=1
  int [] tool_add={50,100,0,1,1}; // bullet_add=100, med_add=10
  String[] tool = {
    "tool_bullet.png",
    "tool_med.png",
    "gun0.png",
    "gun1.png",
    "gun2.png"
  };
  
  String[] gun = {
    "gun0.png",
    "gun1.png",
    "gun2.png"
  };
  String[] toolname = {
    "bullet",
    "med",
    "gun0",
    "gun1",
    "gun2",
  };
  PImage []   toolImage = new PImage [tool.length+1] ;
  PImage []   gunImage = new PImage [gun.length+1] ;
  PVector [][] tool_location = new PVector[toolname.length][max(tool_num[0],tool_num[1])];


  TOOL(){
    load(toolImage,tool);
    load(gunImage,gun);
    for (int i=0; i<toolname.length; i++) {
      settool(tool_location[i], tool_num[i]);
    }
  };
  /*----------TOOL LOCATION SETTING-----------*/
  void settool(PVector [] location, int num ){
     for (int i=0; i<num; i++){
   
      location[i]=new PVector(int (random(-bgimg.width/2+imgX*2,
                                          bgimg.width/2+imgX-(W-imgX))),
                              int (random(-bgimg.height+H+imgY,
                                           H-(H-imgY))));
    }
  }
  /*----------TOOL MOVE-----------*/
  void toolmove(int[] m){
    for (int i=0; i<toolname.length; i++){         
        for (int j=0; j<tool_num[i]; j++){
          tool_location[i][j].x-=m[0];
          tool_location[i][j].y-=m[1];
          }
      }
  }
  
  void draw(){
     for (int i=0; i<toolname.length; i++){
        for (int j=0; j<tool_num[i]; j++){
          //println(i,j,tool_num[i], " www ");
          if (tool_location[i][j].x <=imgX+ r.getredimg(r.getredindex()).width/2 
          && tool_location[i][j].x >=imgX- r.getredimg(r.getredindex()).width/2
          && tool_location[i][j].y <=imgY+ r.getredimg(r.getredindex()).height/2
          && tool_location[i][j].y >=imgY- r.getredimg(r.getredindex()).height/2){
           if (i>=toolname.length-gun.length){
              //print(i-tool.length+gun.length);
              weapon_now[i-tool.length+gun.length] += tool_add[i];
              tool_num[i] -=1;
            }
          else{
            tool_now[i] += tool_add[i];        
            int mx=int(bgimg.width/2-W2)-int(move.x);
            int my=int(bgimg.height-H)-int(move.y);
            tool_location[i][j].set(new PVector (int (random(-bgimg.width/2+imgX*2+mx,
                                                              bgimg.width/2+imgX-(W-imgX)+mx)),
                                                 int (random(-bgimg.height+H+imgY+my,
                                                              H-(H-imgY)+my))));
            //println(tool_location[i][j].x,tool_location[i][j].y);
            }
          }
          push();
            fill(225);
            //circle(tool_location[i][j].x,tool_location[i][j].y,100);
            imageMode(CENTER);
            image(toolImage[i],tool_location[i][j].x, tool_location[i][j].y);
          pop();
        }
      }
  };
  
  /*----------DRAW WEAPON -----------*/
  void drawweapon(){
    int imageblock=70, ix=-100, iy=-70;
    push();
      fill(225,0,0,40);
      rectMode(CENTER);
      rect(W+ix,H2,gunImage[0].width, H);
    pop();
    for (int i=1; i<gun.length; i++){
      //println(i);
      push();
        /*
        PImage alp_change_image=createImage(gunImage[i].width,gunImage[i].height,ARGB);
        alp_change_image.copy(gunImage[i],0,0,gunImage[i].width,gunImage[i].height,0,0,gunImage[i].width,gunImage[i].height);
        if (weapon_now[i]==0){
          alp_change_image.loadPixels();
            for(int j=0;j< alp_change_image.pixels.length;j++) {
              color c =  alp_change_image.pixels[j] ; 
              c = color(red(c),green(c),blue(c),0);
              alp_change_image.pixels[j]  = c ;
            }
          alp_change_image.updatePixels();
          blendMode(SUBTRACT  );
        }*/
        if (weapon_now[i]==0) blendMode(SUBTRACT  );
        imageMode(CENTER);
        image(gunImage[i],W+ix,H+iy-i*imageblock);
      pop();
      if(weapon_now[i]==0)  continue;
      if (mouseX>W+ix-gunImage[i].width/2 && 
          mouseX<W+ix+gunImage[i].width/2 &&
          mouseY>H+iy-i*imageblock-gunImage[i].height/2 &&
          mouseY<H+iy-i*imageblock+gunImage[i].height/2){
            if (mousePressed==true) {
              r.setredindex(i); 
              bu.setkind(i);
            }
            push();
              strokeWeight(2); stroke(200);
              fill(0,0,0,0);
              rectMode(CENTER);
              rect(W+ix,H+iy-i*imageblock,gunImage[i].width ,gunImage[i].height*0.8);
            pop();
         }
      if (i== bu.getkind()){
        push();
          strokeWeight(2); stroke(200);
          fill(0,0,0,0);
          rectMode(CENTER);
          rect(W+ix,H+iy-i*imageblock,gunImage[i].width ,gunImage[i].height*0.8);
        pop();
      }
    }
  }
  
}
