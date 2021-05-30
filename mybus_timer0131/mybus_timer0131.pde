/*
  這是一個公車動態顯示器
*/
PFont font1,font2;

void setup()
{
  //字形
  font1 = createFont("微軟正黑體",60);//中文
  font2 = createFont("Microsoft New Tai Lue",100);//英文和數字
  size(800,900);
}
//3600=1min,60=1sec
//3600*10=10min
int time[]={3600*2,3600*5,-1};
void draw()
{
  background(#7AE0CD);
  fill(0);
  textSize(30);
  
  for(int i=0;i<=5;i++)
  {
    line(0,150+i*150,800,150+i*150);
    strokeWeight(4); 
  }
  //rect(40,20,200,100,50);
  Cbtext("承德幹線",40,40);
  Nbtext("9",40+40,40+190);
  Nbtext("274",40,40+190+120);
  //承德幹線
  if(time[0]>3600)
  {
    if(time[0]<3600*10)
    {
      caltext(" "+time[0]/3600,600,70);
    }
    else
    {
      caltext(" "+time[0]/3600,540,70);
    }
    textFont(font1);
    textSize(50);
    text("分鐘",680,70);
    text("Min",690,120);
    time[0]--;
  }
  else if(time[0]==0)
  {
    time[0]=3600*2;
  }
  else if(time[0]==-1)
  {
    fill(0);
    textSize(60);
    textFont(font1);
    text("今日未營運",540,60);
    textSize(40);
    text("NoService",540,120);
  }
  else
  {
    fill(0);
    textSize(60);
    textFont(font1);
    text("即將進站",540,60);
    textSize(40);
    text("ComingSoon",540,120);
    time[0]--;
  }  
  //9號
  if(time[1]>3600)
  {
    if(time[1]<3600*10)
    {
      caltext(" "+time[1]/3600,600,70+150);
    }
    else
    {
      caltext(" "+time[1]/3600,540,70+150);
    }
    textFont(font1);
    textSize(50);
    text("分鐘",680,70+150);
    text("Min",690,120+150);
    time[1]--;
  }
  else if(time[1]==0)
  {
    time[1]=3600*5;
  }
  else if(time[1]==-1)
  {
    fill(0);
    textSize(60);
    textFont(font1);
    text("今日未營運",540,60+150);
    textSize(40);
    text("NoService",540,120+150);
  }
  else
  {
    fill(0);
    textSize(60);
    text("即將進站",540,60+150);
    textSize(40);
    text("ComingSoon",540,120+150);
    time[1]--;
  }
  
  //274號
  if(time[2]>3600)
  {
    if(time[2]<3600*10)
    {
      caltext(" "+time[2]/3600,600,70+150+150);
    }
    else
    {
      caltext(" "+time[2]/3600,540,70+150+150);
    }
    textFont(font1);
    textSize(50);
    text("分鐘",680,70+150+150);
    text("Min",690,120+150+150);
    time[1]--;
  }
  else if(time[2]==0)
  {
    time[2]=3600*5;
  }
  else if(time[2]==-1)
  {
    fill(0);
    textSize(60);
    textFont(font1);
    text("今日未營運",490,60+150+150);
    textSize(40);
    text("NoService",600,120+150+150);
  }
  else
  {
    fill(0);
    textSize(60);
    text("即將進站",540,60+150+150);
    textSize(40);
    text("ComingSoon",540,120+150+150);
    time[2]--;
  }
  println("m0="+time[0]/3600+" s0="+time[0]/60%60+" m1="+time[1]/3600+" s1="+time[1]/60%60);
  //text(mouseX + " " + mouseY,mouseX,mouseY);
}
void Cbtext(String words, int x, int y)
{
    fill(255);
    textFont(font1);
    float w=textWidth(words); 
    fill(#264D46);
    stroke(#264D46);
    rect(x,y,w+20,60,50);
    fill(255);
    text(words,x+10,y+50);
   
}
void Nbtext(String words, int x, int y)
{
    textFont(font2);
    float w=textWidth(words); 
    if(words.length()==1)
    {
      fill(#264D46);
      stroke(#264D46);
      ellipse(x,y,90,90);
      fill(255);
      text(words,x-25,y+35);
    }
    else
    {
      fill(#264D46);
      stroke(#264D46);
      rect(x,y-20,w+20,90,50);
      fill(255);
      text(words,x+10,y+60);
    }
}
void caltext(String words, int x, int y)
{
    textFont(font2);
    float w=textWidth(words); 
    fill(0);
    text(words,x,y+30);
}
