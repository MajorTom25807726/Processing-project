PFont font1,font2;
void setup()
{
  size(760,1000);
  font1 = createFont("Consolas",30);
  font2 = createFont("微軟正黑體",30);
}
int now=0;

int ramen[]={0,0,0,0,0,0};
int money[]={200,220,250,190,299,499};
String country[]={
  "台北的","新北的","桃園的","台中的","台南的","高雄的",
  "新竹的","苗栗的","彰化的","南投的","雲林的","嘉義的",
  "屏東的","宜蘭的","花蓮的","台東的","澎湖的","金門的",
  "連江的","基隆的"};
int con_c=int(random(0,country.length-1));
String name[]={
  "珍妮佛·羅培茲","雪莉","巴嘎NONO","穿山甲","蜂蜜檸檬",
  "QQㄋㄟㄋㄟ好喝到咩噗茶","愛莉莎莎Alisasa","我的豆花30塊",
  "你要不要吃哈密瓜","野豬騎士來囉","開局送魔關羽","澳門賭場上線囉",
  "先按解除鎖定，再按熱水","請用溫開水","小笨狗，你害我好丟臉",
  "茉莉兒 我的晚餐呢"," 媽！飛哥和小佛在亂開場啦！","你在大聲什麼啦",
  "還敢下來啊 冰鳥","緊握扶手 站穩踏階","我們懷念他","南北菜蟲一起串連",
  "冬令時間 洞六洞洞 部隊起床","五分鐘內整裝完畢","連集合場集合",
  "It's good to drink?"
};
int name_c=int(random(0,name.length-1));
String ra[]={
  "醬油豚骨拉麵",
  "招牌舒肥雞拉麵",
  "地獄火拉麵",
  "大蒜豚骨拉麵",
  "主廚特製鹿字燒",
  "奶香金箔玉子燒" 
};
void draw()
{
  //println("name_len="+name.length+"country_len="+country.length);
  stage(now);
}
void stage(int x)
{
  if(x==0) 
    stage0();
  else if(x==1)
    stage1();  
}
void stage0()
{
   background(255);
  //text(mouseX + " " + mouseY,mouseX,mouseY);
  textFont(font2);
  text("主食區",330,50);
  //醬油拉麵按鈕
  noFill();
  rect(30,100,300,160,7);
  buttontext(ra[0],100,100);
  chktext(" + ",100,215);
  chktext(" - ",200,215);
  buttontext("數量:",30,140);
  sumtext(ramen[0],160,140);
  buttontext("金額:",30,180);
  sumtext(ramen[0]*money[0],145,180);
  //舒肥雞拉麵按鈕
  noFill();
  rect(30+400,100,300,160,7);
  buttontext(ra[1],80+400,100);
  chktext(" + ",120+400,215);
  chktext(" - ",210+400,215);
  buttontext("數量:",30+400,140);
  sumtext(ramen[1],160+400,140);
  buttontext("金額:",30+400,180);
  sumtext(ramen[1]*money[1],145+400,180);
  //地獄火拉麵按鈕
  noFill();
  rect(30,100+180,300,160,7);
  buttontext(ra[2],100,100+180);
  chktext(" + ",110,215+180);
  chktext(" - ",210,215+180);
  buttontext("數量:",30,140+180);
  sumtext(ramen[2],160,140+180);
  buttontext("金額:",30,180+180);
  sumtext(ramen[2]*money[2],145,180+180);
  //大蒜豚骨拉麵按鈕
  noFill();
  rect(30+400,100+180,300,160,7);
  buttontext(ra[3],100+400,100+180);
  chktext(" + ",120+400,215+180);
  chktext(" - ",210+400,215+180);
  buttontext("數量:",30+400,140+180);
  sumtext(ramen[3],160+400,140+180);
  buttontext("金額:",30+400,180+180);
  sumtext(ramen[3]*money[3],145+400,180+180);
  textFont(font2); 
  text("副食區",330,500);
  //主廚特製鹿字燒按鈕
  noFill();
  rect(30,100+180+250,300,160,7);
  buttontext(ra[4],80,100+180+250);
  chktext(" + ",120,215+180+250);
  chktext(" - ",210,215+180+250);
  buttontext("數量:",30,140+180+250);
  sumtext(ramen[4],160,140+180+250);
  buttontext("金額:",30,180+180+250);
  sumtext(ramen[4]*money[4],145,180+180+250);
  //奶香金箔玉子燒按鈕
  noFill();
  rect(30+400,100+180+250,300,160,7);
  buttontext(ra[5],80+400,100+180+250);
  chktext(" + ",120+400,215+180+250);
  chktext(" - ",210+400,215+180+250);
  buttontext("數量:",30+400,140+180+250);
  sumtext(ramen[5],160+400,140+180+250);
  buttontext("金額:",30+400,180+180+250);
  sumtext(ramen[5]*money[5],145+400,180+180+250);
  chktext("確定餐點及數量",280,800);
}
int newy=0;
void stage1()
{
  background(255);
  textFont(font2);
  text("餐點總結",310,50);
  text("=======================",100,70);
  text(mouseX + " " + mouseY,mouseX,mouseY);
  int j=0,sum=0;
  for(int i=0;i<=5;i++)
  {   
    if(ramen[i]!=0)
    {
      text(ra[i],100,100+(j*40));
      text(ramen[i]+"份",400,100+(j*40));
      text("金額:"+ramen[i]*money[i],470,100+(j*40));
      sum+=ramen[i]*money[i];
      j++;
    }
    
  }
  text("點餐時間:",100,100+(j*40));
  textFont(font1);
  text(hour()+":"+minute(),250,100+(j*40));
  textFont(font2);
  text("總額:"+sum,470,100+(j*40));
  text("櫃台:"+country[con_c]+name[name_c],100,100+((j+1)*40));
  chktext("重新點餐",310,100+((j+2)*40));
  newy=100+((j+2)*40);
  //println(100+((j+2)*40));
}
void buttontext(String words,int x,int y)
{
    textFont(font2);
    float w=textWidth(words); 
    fill(0);
    text(words,x,y+30);
}
void sumtext(int words,int x,int y)
{
    textFont(font1);
    fill(0);
    text(words,x,y+30);
}
void chktext(String words,int x,int y)
{
    textFont(font2);
    float w=textWidth(words); 
    fill(0);
    text(words,x,y+30);
    noFill();
    rect(x,y,w,35,10);
}
void mousePressed()
{
  //醬油拉麵+-
  if(100<=mouseX && mouseX<=135 && 215<=mouseY && mouseY<=250)
    ramen[0]+=1;
  if(200<=mouseX && mouseX<=230 && 210<=mouseY && mouseY<=250)
    if(ramen[0]>=1)
      ramen[0]-=1;
  //舒肥雞拉麵+-
  if(520<=mouseX && mouseX<=560 && 215<=mouseY && mouseY<=250)
    ramen[1]+=1;
  if(610<=mouseX && mouseX<=635 && 215<=mouseY && mouseY<=250)
    if(ramen[1]>=1)
      ramen[1]-=1;     
  //地獄拉麵+-
  if(120<=mouseX && mouseX<=155 && 395<=mouseY && mouseY<=430)
    ramen[2]+=1;
  if(205<=mouseX && mouseX<=235 && 395<=mouseY && mouseY<=430)
    if(ramen[2]>=1)
      ramen[2]-=1;
  //大蒜豚骨拉麵+-
  if(510<=mouseX && mouseX<=560 && 395<=mouseY && mouseY<=430)
    ramen[3]+=1;
  if(210+400<=mouseX && mouseX<=230+400 && 395<=mouseY && mouseY<=430)
    if(ramen[3]>=1)
      ramen[3]-=1;
  //鹿字燒+-
  if(120<=mouseX && mouseX<=155 && 645<=mouseY && mouseY<=680)
    ramen[4]+=1;
  if(210<=mouseX && mouseX<=230 && 645<=mouseY && mouseY<=680)
    if(ramen[4]>=1)
      ramen[4]-=1;
  //玉子燒+-
  if(520<=mouseX && mouseX<=555 && 645<=mouseY && mouseY<=680)
    ramen[5]+=1;
  if(610<=mouseX && mouseX<=635 && 645<=mouseY && mouseY<=680)
    if(ramen[5]>=1)
      ramen[5]-=1;
  if(now==0 && 280<=mouseX && mouseX<=490 && 800<=mouseY && mouseY<=840)
    now=1;
  if(now==1 && 310<=mouseX && mouseX<=430 && newy<=mouseY && mouseY<=newy+40)
    now=0;
}
