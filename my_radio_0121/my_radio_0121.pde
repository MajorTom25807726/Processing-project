/*
這是聯合粉點點的音樂播放器
 */
import ddf.minim.*;
Minim minim;
PImage img1, img2, img3, img4; 
PFont font1,font2;
AudioPlayer player[];
int h=hour(), min=minute(), day=day(), year=year(), mon=month();
void setup()
{
  int mc=12;
  size(900, 600);
  img1 = loadImage("radio.jpg");
  img2 = loadImage("play_black.png");
  img3 = loadImage("pause_red.png");
  img4 = loadImage("pause_black.png");
  font1 = createFont("Consolas", 25);
  font2 = createFont("微軟正黑體", 25);
  minim = new Minim(this);
  player = new AudioPlayer[mc];
  for (int i=0; i<mc; i++)
  {
    player[i] = minim.loadFile("music"+i+".mp3");
  }
}
String songname[]=
{
  "田馥甄 諷刺的情書",
  "田馥甄 Intro",
  "田馥甄 人什麼的最麻煩",
  "田馥甄 田",
  "田馥甄 一一",
  "田馥甄 先知",
  "田馥甄 歇斯底里",
  "田馥甄 或是一首歌",
  "田馥甄 皆可",
  "田馥甄 無人知曉",
  "田馥甄 懸日",
};
int now=-1;
void draw()
{
  background(255);
  image(img1, 150, 100);
  image(img2, 400, 255, 30, 30);
  image(img4, 440, 255, 30, 30);
  //左音響圓
  noFill();
  ellipse(243, 340, 50, 50);
  fill(0);
  ellipse(243, 340, 40, 40);
  noFill();
  ellipse(243, 395, 50, 50);
  fill(0);
  ellipse(243, 395, 40, 40);
  //右音響圓
  noFill();
  ellipse(625, 340, 50, 50);
  fill(0);
  ellipse(625, 340, 40, 40);
  noFill();
  ellipse(625, 395, 50, 50);
  fill(0);
  ellipse(625, 395, 40, 40);
  textFont(font2);
  if(sum==-1)
  {
     text("請輸入妳想聽第幾首歌(0~10):", 210, 211);
     textFont(font1);
     text(input,560,211);
  }
  else if(0<=sum && sum<=10)
  {
     text("現在播放的是:"+songname[int(input)],210, 211);
  }
  else if(sum>=11)
  {
    text("請輸入妳想聽第幾首歌(0~11):輸入錯誤\n請按*重新輸入",210,211);
  }
  //println(sum);
  time();
  fill(0);
  text(mouseX + " " + mouseY, mouseX, mouseY);
}
void time()
{
   textFont(font1);
   text(year+"/"+mon+"/"+day, 220, 275);
  if (h<10)
    text("0"+h+":"+min, 580, 275);
  else if (min<10)
    text(h+":"+"0"+min, 580, 275);
  else
    text(h+":"+min, 580, 275);
}
int sum=-1,error=0;
int time0=0;
String input = "";
void keyPressed()
{
  if (key==BACKSPACE) 
  { //按下 BackSpace 倒退鍵
    if (input.length()>0) 
    { //如果有字可倒退, 就倒退1字元
      input = input.substring(0, input.length()-1);
    }
  }
  else if (key==ENTER) 
  { //按下 Enter 鍵, 表示跳行
    sum=int(input);
    if(0<=sum && sum<=10)
    {
      if(time0==0) 
      {
        player[int(input)].rewind();
        player[int(input)].play();
        time0=300;
      }
    }
    else
    {
      sum=int(input);
    }
   if(time0>0) time0--; //跳行, 可配合 text() 的\n功能, 配合 textLeading() 行距顯示
  } 
  else if (key==CODED) 
  { //按下特殊鍵, 如 SHIFT, CTRL, ALT 等
    //Do nothing, 不記錄CODED特殊鍵
  } 
  else if('0'<=key && key<='9')
  { //如果按下 普通字母/符號按鍵, 記錄下來
    input += key; //記錄下來
  }
  else if(key==42)
    sum=-1;
}
/*
void keyPressed()
 {
 text1+=key;
 if(key == 49)
 {
 //諷刺的情書
 if(time0==0) 
 {
 player[0].rewind();
 player[0].play();
 time1=300;
 }
 if(time0>0) time0--;
 
 }
 if(key==50)
 {
 //intro
 if(time1==0) 
 {
 player[1].rewind();
 player[1].play();
 time1=300;
 }
 if(time1>0) time1--;
 }
 if(key==51)
 {
 //人什麼的最麻煩了
 if(time2==0) 
 {
 player[2].rewind();
 player[2].play();
 time2=300;
 }
 if(time2>0) time2--;
 }
 
 }*/
