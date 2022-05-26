class RED{
  int redindex;
  String[] red = {
    "girl_gun0.png",
    "girl_gun1.png",
    "girl_gun2.png",
  };
  PImage []   redImage = new PImage [red.length] ;
  
  RED(){
    redindex=0;
    load(redImage,red);
    imgX=W2;
    imgY=H-redImage [redindex].height/4;
  };
  
  void setredindex(int index){
    redindex=index;
  }
  int getredindex(){
    return redindex;
  }
  
  PImage getredimg(int index){
    return redImage[index];
  }
  
  void draw(){
      if (redImage[redindex] != null){
        push();
        if (attack==1) tint(153, 12, 10, 150);
        imageMode(CENTER);
        float angle = atan2(mouseY - imgY, mouseX - imgX);
        translate(imgX,imgY);
        rotate(angle+1.5);
        image(redImage [redindex],0,0);
        noTint();
        rotate(-angle-1.5);
        translate(-imgX,-imgY);
    
        pop();
      }
  }
}
