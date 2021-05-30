/*
  今天要做一個計時器和顯示時間的機器
*/
import ddf.minim.*;
Minim minim;
PImage img[];
AudioPlayer player1;
void setup()
{
  int sum=10;
  size(600,300);
  minim = new Minim(this);
  player1 = minim.loadFile("music.mp3");
  img= new PImage[sum];
  for(int i=0;i<sum;i++)
  {
    img[i]=loadImage("num"+i+".png");
  }
}
int now=0;
void draw()
{
  stage(now);
}
void stage0()//顯示時間
{
  int h=hour(),min=minute();
  background(255);
  fill(#AA849B);
  rect(20,50,550,170,7);
  //小時
  image(img[h/10],140,50,img[h/10].width/1.2,img[h/10].height/1.2);
  image(img[h%10],200,50,img[h%10].width/1.2,img[h%10].height/1.2);
  //分鐘
  image(img[min/10],320,50,img[min/10].width/1.2,img[min/10].height/1.2);
  image(img[min%10],380,50,img[min%10].width/1.2,img[min%10].height/1.2);
  fill(0);
  rect(300,110,20,20,5);
  fill(0);
  rect(300,150,20,20,5);
  fill(0);
  textSize(30);
  //text(mouseX + " " + mouseY,mouseX,mouseY);  
}
void stage1()//顯示月日
{
  int d=day(),mon=month();
  background(255);
  fill(#AA849B);
  rect(20,50,550,170,7);
  //月份
  image(img[mon/10],140,50,img[mon/10].width/1.2,img[mon/10].height/1.2);
  image(img[mon%10],200,50,img[mon%10].width/1.2,img[mon%10].height/1.2);
  
  //日期
  image(img[d/10],320,50,img[d/10].width/1.2,img[d/10].height/1.2);
  image(img[d%10],380,50,img[d%10].width/1.2,img[d%10].height/1.2);
  fill(0);
  textSize(100);
  text("/",280,160);
}
int sw=0;
int sum=0;
int m=0,s=0;
int time0=0;
void stage2()
{
  background(255);
  fill(#AA849B);
  rect(20,50,550,170,7);
   //分鐘
  if(sw==1 && sum>0)
    sum--;
  m=sum/3600;
  s=sum/60%60;
  image(img[m/10],140,50,img[m/10].width/1.2,img[m/10].height/1.2);
  image(img[m%10],200,50,img[m%10].width/1.2,img[m%10].height/1.2);
  
  //日期
  image(img[s/10],320,50,img[s/10].width/1.2,img[s/10].height/1.2);
  image(img[s%10],380,50,img[s%10].width/1.2,img[s%10].height/1.2);
  if(sw==1 && m==0 && s==0)
  {
    if(time0==0) 
    {
       player1.rewind();
       player1.play();
       time0=30000;
    }
    if(time0>0) time0--;
  }
  
  fill(0);
  rect(300,110,20,20,5);
  fill(0);
  rect(300,150,20,20,5);
}
void stage(int x)
{
  if(x==0) 
    stage0();
  else if(x==1)
    stage1(); 
  else if(x==2)
    stage2();
    
  
}
void keyPressed()
{
  if(key=='0')
    now=0;
  if(key=='1')
    now=1;
  if(key=='2')
    now=2;
  if(key=='i' || key=='I')
    sum+=3600;
  if(key=='k' && sum-3600>0|| key=='K'&& sum-3600>0)
    sum-=3600;
  if(key=='o' || key=='O')
    sum+=60;
  if(key=='l' && sum-60>0|| key=='L' && sum-60>0)
    sum-=60;
  if(key=='*')
    sw=1;
}
/*
image(img[time_sum%60/10],320,50,img[time_sum%60/10].width/1.2,img[time_sum%60/10].height/1.2);
image(img[time_sum%60%10],380,50,img[time_sum%60%10].width/1.2,img[time_sum%60%10].height/1.2);
*/
