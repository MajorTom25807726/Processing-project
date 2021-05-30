PImage img,img2,img3,img4,img5,img6;
PFont Font1,Font2;
void reset(int stage)
{
  if(stage==1)
  {
    x=100; y=170; vx=0; vy=0;
  }
  else if(stage==2)
  {
    x=200;y=170;vx=0;vy=0;
  }
}
void setup()
{
  size(640,450);
  Font1 = createFont("Arial Bold", 18);
  Font2 = createFont("標楷體", 18);
  img = loadImage("man.png");//載入圖片
  img2 = loadImage("manr.png");
  img3 = loadImage("room.png");
  img4 = loadImage("stair.png");
  img5=loadImage("map1.png");
  img6=loadImage("map2.png");
}
float x=100,y=170,vx=0,vy=0;//設定角色如何移動
int stage=0;//控制場景
int showT=0;//控制顯示時間
int obj=0;//點擊後出現哪個東西的說明
int dir=1; //控制角色方向
int Score=0;//C語言小遊戲計分
//第一關
//obj=1:時鐘 obj=2:海報 obj=3:桌面 obj=4:主機
//第二關
//obj=5:忍字海報 obj=6:憲兵摩托 obj=7:星際奇航海報
color predict()
{
  int newX=int(x+vx), newY=int(y+vy);
  return pixels[newX+newY*width];
}
void draw()
{
  textFont(Font1);
  loadPixels();
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
     
     if(-26<x+vx &&x+vx<482 && y+vy==170)
     {
      x+=vx;
      y+=vy;
     }
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
    text(predict(),mouseX,mouseY);
    //if(predict()!=0)
      x+=vx;y+=vy;
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
    background(#F7FFFF);
    myShowText("Learning more about C",200,100);
    myShowText("Start!",180,250);
    myShowText("Leave to Menu!",300,250);
    //text(mouseX + " " + mouseY,mouseX,mouseY);//檢查座標
  }
  else if(stage==5)
  {
    textFont(Font2);
    background(#F7FFFF);
    myShowTextNR("Quiz 1(1/3)",280,50);
    myShowTextNR("請問下列程式是否可以正確編譯並加以執行?",50,100);
    myShowTextNR("#include <stdio.h>",50,130);
    myShowTextNR("int main(void)",50,160);
    myShowTextNR("{",50,190);
    myShowTextNR(" printf('This is a key.');",50,210);
    myShowTextNR(" system('PAUSE');",50,240);
    myShowTextNR(" return 0;",50,270);
    myShowTextNR("}",50,300);
    myShowText("Correct",200,400);
    myShowText("Error",300,400);
  }
  else if(stage==6)
  {
    textFont(Font2);
    background(#F7FFFF);
    myShowTextNR("Quiz 1(1/3)",280,50);
    myShowTextNR("請問下列程式是否可以正確編譯並加以執行?",50,100);
    myShowTextNR("#include <stdio.h>",50,130);
    myShowTextNR("int main(void)",50,160);
    myShowTextNR("{",50,190);
    myShowTextNR(" printf('This is a key.');",50,210);
    myShowTextNR(" system('PAUSE');",50,240);
    myShowTextNR(" return 0;",50,270);
    myShowTextNR("}",50,300);
    myShowTextNR("ANS=Error",50,330);
    myShowTextNR("Point = "+ Score,50,360);
    myShowText("Next",450,400);
    //text(mouseX + " " + mouseY,mouseX,mouseY);檢查座標
   }
  else if(stage==7)
  {
    textFont(Font2);
    background(#F7FFFF);
    myShowTextNR("Quiz 2(2/3)",280,50);
    myShowTextNR("請問下列程式是否可以正確編譯並加以執行?",50,100);
    myShowTextNR("#include <stdio.h>",50,130);
    myShowTextNR("int main(void)",50,160);
    myShowTextNR("{",50,190);
    myShowTextNR(" return 0;",50,210);
    myShowTextNR("}",50,240);
    myShowText("Correct",200,270);
    myShowText("Error",200,330);
    //text(mouseX + " " + mouseY,mouseX,mouseY);//檢查座標
  }
  else if(stage==8)
  {
    textFont(Font2);
    background(#F7FFFF);
    myShowTextNR("Quiz 2(2/3)",280,50);
    myShowTextNR("請問下列程式是否可以正確編譯並加以執行?",50,100);
    myShowTextNR("#include <stdio.h>",50,130);
    myShowTextNR("int main(void)",50,160);
    myShowTextNR("{",50,190);
    myShowTextNR(" return 0;",50,210);
    myShowTextNR("}",50,240);
    myShowTextNR("ANS=Error",50,270);
    myShowTextNR("Point = "+ Score,50,300);
    myShowText("Next",450,400);
  }
  else if(stage==9)
  {
    textFont(Font2);
    background(#F7FFFF);
    myShowTextNR("Quiz 3(3/3)",280,0);
    myShowTextNR("請在底線出寫出最適當的程式碼，在畫面顯示c1和c2的字元,\n並產生如後的執行結果。",10,30);
    myShowTextNR("#include <stdio.h>",10,80);
    myShowTextNR("#include <stdlib.h>",10,100);
    myShowTextNR("int main(void)",10,120);
    myShowTextNR("{",10,150);
    myShowTextNR(" char c1 = 'A', c2 = 'B'; ",10,180);
    myShowTextNR(" printf(\"________\",c1,c2)",10,210);
    myShowTextNR(" system(\"PAUSE\");",10,240);
    myShowTextNR(" return 0;",10,270);
    myShowTextNR("}",10,300);
    myShowTextNR("===執行結果===",10,330);
    myShowTextNR("A,B",10,360);
    myShowTextNR("請按任意鍵繼續 . . .",10,390);
    myShowText("%c,%c",400,300);
    myShowText("%d,%d",400,360);
    //text(mouseX + " " + mouseY,mouseX,mouseY);//檢查座標
  }
  else if(stage==10)
  {
    textFont(Font2);
    background(#F7FFFF);
    myShowTextNR("Quiz 3(3/3)",280,0);
    myShowTextNR("請在底線出寫出最適當的程式碼，在畫面顯示c1和c2的字元,\n並產生如後的執行結果。",10,30);
    myShowTextNR("#include <stdio.h>",10,80);
    myShowTextNR("#include <stdlib.h>",10,100);
    myShowTextNR("int main(void)",10,120);
    myShowTextNR("{",10,150);
    myShowTextNR(" char c1 = 'A', c2 = 'B'; ",10,180);
    myShowTextNR(" printf(\"________\",c1,c2)",10,210);
    myShowTextNR(" system(\"PAUSE\");",10,240);
    myShowTextNR(" return 0;",10,270);
    myShowTextNR("}",10,300);
    myShowTextNR("===執行結果===",10,330);
    myShowTextNR("A,B",10,360);
    myShowTextNR("請按任意鍵繼續 . . .",10,390);
    myShowText("ANS=%c,%c",400,300);
    myShowText("Point = "+ Score,400,360);
    //text(mouseX + " " + mouseY,mouseX,mouseY);//檢查座標
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
void myShowTextNR(String words, int x,int y)
{
  textSize(20);
  float w=textWidth(words); 
  fill(0);
  text(words,x,y+30);
}
void myShowText(String words, int x,int y)
{
  textSize(20);
  float w=textWidth(words); 
  fill(0);
  text(words,x,y+30);
  if(stage==0)
  {
    noFill();
    rect(x,y,w,40);
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
    {
      stage=1;
      reset(1);
    }
    if(mousePressed && 36<mouseX && mouseX<129 && 222<mouseY && mouseY<442)
    stage=3;   
  }
  else if(stage==3)
  {
    noFill();
    rect(x,y,w,40);
  }
  else if(stage==4)
  {
    noFill();
    rect(x,y,w,40);
  }
  else if(stage==5)
  {
    
    noFill();
    rect(x,y,w,40);
    if(mousePressed && 200<mouseX && mouseX<264 && 400<mouseY && mouseY<430)
    { 
      
      stage=6;
      Score=0;
    }
    else if(mousePressed && 300<mouseX && mouseX<340 && 400<mouseY && mouseY<430)
    {
      stage=6;
      Score=10;
    }
  }
   else if(stage==6)
  {
    fill(#F5FFFF); 
    noFill();
    rect(x,y,w,40);
    fill(0);
    text(words,x,y+30);
    if(mousePressed && 449<mouseX && mouseX<488 && 400<mouseY && mouseY<440)
      stage=7;
  }
  else if(stage==7)
  {
    
    noFill();
    rect(x,y,w,40);
    if(mousePressed && 200<mouseX && mouseX<270 && 270<mouseY && mouseY<310)
    { 
      
      stage=8;
      Score+=0;
    }
    else if(mousePressed && 200<mouseX && mouseX<250 && 330<mouseY && mouseY<370)
    {
      stage=8;
      Score+=10;
    }
  }
  else if(stage==8)
  {
    fill(#F5FFFF);
    noFill();
    rect(x,y,w,40);
    fill(0);
    text(words,x,y+30);
    if(mousePressed && 449<mouseX && mouseX<488 && 400<mouseY && mouseY<440)
      stage=9;
    
  }
   else if(stage==9)
  {
    
    noFill();
    rect(x,y,w,40);
    if(mousePressed && 400<mouseX && mouseX<450 && 300<mouseY && mouseY<340)
    { 
      
      stage=10;
      Score+=10;
    }
    else if(mousePressed && 400<mouseX && mouseX<450 && 360<mouseY && mouseY<400)
    {
      stage=10;
      Score+=0;
    }
  }
  else if(stage==10)
  {
    fill(#F5FFFF); 
    fill(0);
    text(words,x,y+30);
    
  }
 
}
void mousePressed()
{
  if(stage==1)
  {
    if(244*2<mouseX && mouseX<290*2 && 70*2<mouseY && mouseY<93*2)
    {
      stage=2;
      reset(2);
    }

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
  if(stage==4)
  {
    if(mousePressed && 180<mouseX && mouseX<229 && 248<mouseY && mouseY<289)
      stage=5;
    if(mousePressed && 300<mouseX && mouseX<444 && 250<mouseY && mouseY<290)
      stage=0;
  }
}
