PImage img,img2,img3,img4;
PFont Font1;
void setup()
{
  size(640,450);
  Font1 = createFont("Arial Bold", 18);
  img = loadImage("man.png");//載入圖片
  img2 = loadImage("manr.png");
  img3 = loadImage("room.png");
  img4 = loadImage("stair.png"); 
}
float x=100,y=170,vx=0,vy=0;//設定角色如何移動
int stage=0;//控制場景
int showT=0;//控制顯示時間
int obj=0;//點擊後出現哪個東西的說明
int dir=1; //控制角色方向
//第一關
//obj=1:時鐘 obj=2:海報 obj=3:桌面 obj=4:主機
//第二關
//obj=5:忍字海報 obj=6:憲兵摩托 obj=7:星際奇航海報
void draw()
{
  textFont(Font1);
 
  if(stage==0)
  {
    background(#BA92E5);
    myShowText("Menu",290,100);
    myShowText("Press to play!",250,200);
    myShowText("Play C language quiz",230,300);
      
  }
  else if(stage==1)
  {
    image( img3, 0, 0, 640,450);
    if(dir==1)
      image( img, x, y,202,300);
    else if(dir==2)
      image( img2, x, y,202,300);
    x+=vx;
    y+=vy;
    if(showT>0)
     {
       if(obj==1)
       {
         myShowText("It is 10 o'clock in the morning!",(int)x+130,(int)y-10);
         showT--;
       }
       else if(obj==2)
       {
         myShowText("It is my Father's Military Service Conscription Poster!",(int)x+130,(int)y-10);
         showT--;
       }
       else if(obj==3)
       {
         myShowText("It is Windows XP's background!",(int)x+130,(int)y-10);
         showT--;
       }
       else if(obj==4)
       {
         myShowText("It has PTX 3070 Ti and P9-10900KFC!",(int)x+130,(int)y-10);
         showT--;
       }     
     }
    
  }
  else if(stage==2)
  {
    image( img4, 0, 0, 640,450);
    if(dir==1)
      image(img, x-100, y-100,101,150);
    else if(dir==2)
      image(img2, x-100, y-100,101,150);
    x+=vx;
    y+=vy;
    myShowText("Back to Room!",18,18);
    if(showT>0)
    {
      if(obj==5)
       {
         myShowText("It is ninjia's first word in Chinese!",(int)x+20,(int)y-110);
         showT--;
       }
      if(obj==6)
       {
         myShowText("It is MP ride their Motrocycle!",(int)x+20,(int)y-110);
         showT--;
       }
       if(obj==7)
       {
         myShowText("It is Space Oddity Poster!",(int)x+20,(int)y-110);
         showT--;
       }
       
       
    }    
  }
  else if(stage==3)
  {
    background(#08F9FF);
    myShowText("Congratulations! You Finished the Demo game OUOb",60,100);
    myShowText("Play Again!",100,200);
    myShowText("Leave to Menu!",400,200);
  }
  else if(stage==4)
  {
    background(#FF00EF);
    myShowText("Start!",180,250);
    myShowText("Leave to Menu!",300,250);
  }
}
void keyPressed()
{
  if(keyCode == UP )
    vy=-2;
  if(keyCode == DOWN )
    vy=2;
  if(keyCode == RIGHT )
  {
   vx=2;
   dir=1;
  }
  if(keyCode == LEFT )
  {
    vx=-2;
    dir=2;
  }
    
}
void keyReleased()//放開按鍵角色停止
{
  vx=0;vy=0;
}
void myShowText(String words, int x,int y)
{
  textSize(20);
  float w=textWidth(words);
  noFill(); 
  rect(x,y,w,40);
  fill(0);
  text(words,x,y+30);
  if(stage==0)
  {
    if(mousePressed && 200<mouseX && mouseX<330 && 200<mouseY && mouseY<250)
    stage=1;
    if(mousePressed && 230<mouseX && mouseX<330 && 300<mouseY && mouseY<350)
    stage=4;
  }
  else if(stage==1)
  {
    fill(#F5FFFF); 
    rect(x,y,w,40);
    fill(0);
    text(words,x,y+30);
  }
  else if(stage==2)
  { 
    fill(#F5FFFF);
    rect(x,y,w,40);
    fill(0);
    text(words,x,y+30);
    if(mousePressed && 18<mouseX && mouseX<150 && 18<mouseY && mouseY<59)
    stage=1;
    if(mousePressed && 36<mouseX && mouseX<129 && 222<mouseY && mouseY<442)
    stage=3;
    
  }
  else if(stage==3)
  {
    
  }
}
void mousePressed()
{
  text(x,y,mouseX,mouseY);
  if(stage==1)
  {
    if(244*2<mouseX && mouseX<290*2 && 70*2<mouseY && mouseY<93*2)
      stage=2;
    if(229*2<mouseX && mouseX<307*2 && 36*2<mouseY && mouseY<58*2)
     {
       showT=180; obj=1;
     }
    if(113*2<mouseX && mouseX<155*2 && 43*2<mouseY && mouseY<101*2)
     {
       showT=180; obj=2;
     }
    if(185*2<mouseX && mouseX<254*2 && 110*2<mouseY && mouseY<144*2)
     {
       showT=180; obj=3;
     }
    if(240*2<mouseX && mouseX<266*2 && 169*2<mouseY && mouseY<224*2)
     {
       showT=180; obj=4;
     }
  }
  if(stage==2)
  {
    if(105*2<mouseX && mouseX<134*2 && 0<mouseY && mouseY<100 )
     {
       showT=180; obj=5;
     }
    if(135*2<mouseX && mouseX<163*2 && 0<mouseY && mouseY<100)
     {
       showT=180; obj=6;
     }
    if(190*2<mouseX && mouseX<220*2 && 0<mouseY && mouseY<100)
     {
       showT=180; obj=7;
     }
  }
  if(stage==3)
  {
    if(dist(mouseX,mouseY,100,200)<100)
      stage=1;
    if(dist(mouseX,mouseY,400,200)<100)
      stage=0;
  }
     
  
}
