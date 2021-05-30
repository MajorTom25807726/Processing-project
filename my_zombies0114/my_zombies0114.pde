import ddf.minim.*;
Minim minim;
//AudioPlayer player1;
PImage chartlist[],file;
PFont font1;
void setup()
{
  int chartnum=16;
  chartlist = new PImage[chartnum];
  for(int i=0;i<chartnum;i++)
  {
    chartlist[i]=loadImage("chart"+i+".jpg");
  }
  file = loadImage("file_final.jpg");
  size(900,600);
  minim = new Minim(this);
  //player1 = minim.loadFile("737bank_angle.mp3");
  font1 = createFont("微軟正黑體",20);
}
int  cnum=int(random(0,15));
int stage=0;
void draw()
{
  stage(stage);
  
  
}
void stage(int x)
{
  if(x==0) 
    stage0();
  /*else if(x==1)
    stage1();
  else if(x==2)
    stage2();
  else if(x==3)
    stage3();
  else if(x==4)
    stage4();
  else if(x==5)
    stage5();  */
}
String chartjob[]={"魔術師","農夫","牛仔","怪咖","電台主持人","肉販",
                   "建築工人","米其林副廚","忍者","舞棍阿北","俠盜",
                   "商人","嘻哈酷小子","大學教授","工程師","米其林主廚"};
String chartjobtrait[] = {"幻術:隱身\n(選擇較差的選項不容易受到負面效果影響)",
                          "種植:每7天食物+1",
                          "放蕩不羈:不太在乎後果\n(選擇較差的選項較容易增加負面影響)",
                          "搞怪:心情值減少降低",
                          "放音樂:心情值減少大幅降低",
                          "開剁:每5天食物+1",
                          "勞工朋友:生命力和體力增加",
                          "精緻美食:製作一份食物得到雙倍食物",
                          "忍術:選擇選項後大幅減少負面影響",
                          "大排場:每次跳舞時可以回滿心情值\n但會引來喪屍",
                          "偷竊:收刮食物會有機率得到多一點食物",
                          "交易:遇到交易事件時\n可用划算的價格換到物品",
                          "耍帥:做選擇時常耍酷\n導致負面影響的機率上升",
                          "授業解惑:遇到幫忙事件可以得到更多回饋",
                          "動手修理:選擇選項時正面影響增加",
                          "用餐愉快:煮食物時消耗資源減少一半"};
void stage0()
{
  background(255);
  image(file,260,10,file.width/1.5,file.height/1.5);
  image(chartlist[cnum],275,60,chartlist[cnum].width*1.5,chartlist[cnum].height*1.5);
  fill(0);
  text(mouseX + " " + mouseY,mouseX,mouseY);
  textFont(font1);
  text("自介",275,40);
  text("職業:\n"+chartjob[cnum],280,180);
  fill(#400D93);
  text("職業特性:\n"+chartjobtrait[cnum],280,250);
  buttontext("重新選擇",700,540);
}
void buttontext(String words, int x, int y)
{
    textSize(20);
    float w=textWidth(words); 
    fill(0);
    text(words,x,y+30);
    noFill();
    rect(x,y,w,40,7);
}
void goodtext(String words, int x, int y)
{
    textSize(20);
    float w=textWidth(words); 
    fill(#FAE603);
    text(words,x,y+30);
    noFill();
    rect(x,y,w,40);
}
void badtext(String words, int x, int y)
{
    textSize(20);
    float w=textWidth(words); 
    fill(#FA0515);
    text(words,x,y+30);
    noFill();
    rect(x,y,w,40);
}
void mousePressed()
{
  if(stage==0 && 700<mouseX && mouseX<780 && 540<mouseY && mouseY<580)
    cnum = int (random(0,16));
  /*else if(stage==1 && mousePressed)
    stage=2;
  else if(stage==3  && 300<mouseX && mouseX<330 && 460<mouseY && mouseY<496)
    stage=0;
  else if(stage==3 && 300<mouseX && mouseX<387 && 400<mouseY && mouseY<440)
    stage=4;*/
}
