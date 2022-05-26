/*---------
0 start
1 game
2 die
3 stop
---------*/
int statue;
int wolf_num=2;
PVector level=new PVector(400,300);//wolf create by
int movespace=2;
PImage bgimg, maskimg, blackmask, stopimage;
int fw=400,fh=30, blocky=100;
PImage a,b;
int [] tool_now={100,1000,0}; // bullet=1000, med=10,killed=0;
int [] weapon_now={1,0,0};// gun0=1,gun1=0, gun2=0;

WOLF w;
RED r;
TOOL t;
BULLET bu;

String P = "/image/";
;PVector move;

float W,H,W2,H2;
float imgX, imgY;
String[] fontList ; 

void setup() {
  fontList = PFont.list();
  /*
  println("System Font list :");
  printArray(fontList);
  */
  textFont(createFont(fontList[ 402],20));
  
  size(800,600,P2D);
  W=width;  H=height;
  W2=W/2;  H2=H/2;
  surface.setResizable(true);
  surface.setLocation(0, 0);
  
  bgimg=loadImage("/image/map.png");
  maskimg=loadImage("/image/map.png");
  PImage mask;
  mask=loadImage("/image/map_mask2.png");
  maskimg.mask(mask);
  
  
  /*----------RANBOW-BULLET CREATE-----------*/
  bu= new BULLET();
  /*----------SET WOLF-----------*/
  w=new WOLF(wolf_num);
  /*----------SET RED-----------*/
  r=new RED();  
  /*----------SET TOOL-----------*/
  t=new TOOL();

  /*-----
  BLACK MASK
  -----------*/
  blackmask= createImage(int(W),int(H),ARGB);
  blackmask.loadPixels();
  for (int j=0; j<blackmask.width;j++)
       for (int k=0; k<blackmask.height;k++)
       {
            int circle=min(int(W),int(H))/4;
            float x=circle-j+W2-circle, y=circle-k+H-circle*2-10;
            if (circle*circle < x*x+y*y){
              if (random((x*x+y*y)-circle*circle)>5000){
                int loc = j + k * blackmask.width ;
                blackmask.pixels[loc] = color (0); 
              }
            }  
        }
   blackmask.updatePixels();
   //blackmask.save(P+"blackmask.png");
   stopimage= createImage(width,height,ARGB);
     
   move= new PVector(int(bgimg.width/2-W2),int(bgimg.height-H));
   statue=0;
 
}


void draw() {
  //println(statue);
  switch(statue){
    case(0):  startwindow();break;
    case(1):  gamewindow();break;
    case(2):  diewindow();break;
    case(3):  stopwindow();break;
    default: break;
  }
}


/*----------
KEY
-----------*/
void keyPressed(){
    if (key == 'P' || key == 'p'){
      if (statue==3)  statue=1;
      else if (statue==1)  {
        stopcount=0;
        stopimage.copy(get(0,0,width,height),0,0,width,height, 0,0,width,height);
        statue=3;
      }
    }
}

/*----------
IMAGE LOADiNG
-----------*/
void load(PImage [] Image, String [] str){
    for (int i = 0 ; i < str.length ; i ++)   
  {
    Image [i] = loadImage(P+str[i]);
    Image[i].resize(Image[i].width%width, Image[i].height%height);
  }
}
