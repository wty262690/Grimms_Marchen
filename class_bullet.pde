class BULLET{
  int bulletkind;
  String[] bullet = {
    "bullet0.png",
    "bullet.png",
  };
  PImage ranbowbullet;
  PImage []   bulletImage = new PImage [bullet.length+1] ;
  FloatList bullet_location = new FloatList();

  BULLET(){
    bulletkind=0;
    load(bulletImage,bullet);
    create_ranbow_bullet();
  }
  void create_ranbow_bullet(){
      ranbowbullet = createImage(10,10,ARGB);
      bulletImage[bullet.length]=ranbowbullet;
  }
  void setkind(int index){
    bulletkind=index;
  }
  int getkind(){
    return bulletkind;
  }
  
  FloatList getlocation(){
    return bullet_location;
  }
  
  void shoot(){
    if (tool_now[0]>0 && bu.getkind()>0){
           float angle = atan2(mouseY - imgY, mouseX - imgX);
           bu.bullet_location.append(100*cos(angle)+ imgX);
           bu.bullet_location.append(100*sin(angle)+ imgY);
           tool_now[0]-=1;
         }
  }
  
  void draw(){
    for (int i=0; i<bullet_location.size(); i=i+2){
      if (bulletkind== bulletImage.length-1){
         ranbowbullet.loadPixels();
         for (int j=0; j<ranbowbullet.width;j++)
          for (int k=0; k<ranbowbullet.height;k++)
            {
              int circle=ranbowbullet.width/2;
              if (circle*circle > (circle-j)*(circle-j)+(circle-k)*(circle-k)){
                int loc = j + k * ranbowbullet.width ;
                ranbowbullet.pixels[loc] = color (frameCount%225,(frameCount-70)%225,(frameCount-150)%225);
              }  
          };
         ranbowbullet.updatePixels();
         push();
           imageMode(CENTER);
           image(ranbowbullet,bullet_location.get(i), bullet_location.get(i+1));
         pop();
      }
      else{
        push();
          imageMode(CENTER);
          image(bulletImage[bulletkind],bullet_location.get(i), bullet_location.get(i+1));
        pop();
      }
      float angle = atan2(bullet_location.get(i+1) - imgY, bullet_location.get(i) - imgX);
      bullet_location.set(i,bullet_location.get(i)+cos(angle)*10);
      bullet_location.set(i+1,bullet_location.get(i+1)+sin(angle)*10);
      
      if (bullet_location.get(i)>W || bullet_location.get(i)<0 || bullet_location.get(i+1)>H || bullet_location.get(i+1)<0){  
        bullet_location.remove(i);
        bullet_location.remove(i);
      } 
    }
  }
  
}
