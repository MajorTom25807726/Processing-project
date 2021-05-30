/*
  這是成績計算器
*/
PFont font1,font2;
int now=0;//控制場景
int now_input=0;//顯示輸入哪個項目
int who=0;//輸入誰的成績或是第幾科的成績
void setup()
{
  size(900,900);
  font1 = createFont("微軟正黑體",30);
  font2 = createFont("Consolas",30);
}
String title[]={
  " 平時成績 ",
  " 平時比例 ",
  " 期中成績 ",
  " 期中比例 ",
  " 期末成績 ",
  " 期末比例 "
};
String score[]={
    "                  ",
    "                  ",
    "                  ",
    "                  ",
    "                  ", 
    "                  ",
    "                  ",
};
int your_score[]={0,0,0,0,0,0};
String now_inputshow[]={
  "尚未點擊輸入框",
  "平時成績",
  "平時比例",
  "期中成績",
  "期中比例",
  "期末成績",
  "期末比例",
  

};
int usual_score[]={0,0,0,0,0,0};
int usual_percent[]={0,0,0,0,0,0};
int minterm_score[]={0,0,0,0,0,0};
int minterm_percent[]={0,0,0,0,0,0};
int final_score[]={0,0,0,0,0,0};
int final_percent[]={0,0,0,0,0,0};
int cal_score[]={0,0,0,0,0,0};
void draw()
{
  
  stage(now);
  
}
float cal(int[] arr){
  float sum = 0;
  for (int i = 0; i < arr.length; i+=2) 
  {
     sum+=(arr[i]*(arr[i+1]*0.01));
  }
  return sum;
}
void stage0()
{
  background(255);
  fill(0);
  textSize(30);
  text(mouseX + " " + mouseY,mouseX,mouseY);
  textFont(font1);
  text("請輸入你的成績",40,80);
  text("你現在輸入的是:"+input+"("+now_inputshow[now_input]+")",330,80);
  text("學業成績結果:"+nf(cal(your_score),0,2),40,235);
  if(59<=cal(your_score) && cal(your_score)<=100 && your_score[0]!=0 && your_score[1]!=0 && your_score[2]!=0 && your_score[3]!=0 && your_score[4]!=0 && your_score[5]!=0)
  {
    fill(#FA7814);//綠
    text("計算結果: 已取得該科目之學分",40,275);
  }
  else if(0<=cal(your_score) && cal(your_score)<59 && your_score[0]!=0 && your_score[1]!=0 && your_score[2]!=0 && your_score[3]!=0 && your_score[4]!=0 && your_score[5]!=0)
  {
    fill(#FF0808);//紅
    text("計算結果: 未取得該科目之學分",40,275);
  }
  //標題,每次+80
  for(int i=0;i<=2;i++)
  {
    for(int j=0;j<=5;j++)
    {
      if(i==0)
        buttontext(title[j],40+135*j,100);
      else if(i==1)
        buttontext(score[j],40+135*j,140);
      else
      {
        if(your_score[j]==-1)
        {
          textFont(font1);
          text("不計分",70+135*j,170);
          your_score[j]-=0;
        }
        else if(-1<=your_score[j] && your_score[j]<=100)
        {
          textFont(font2);
          text(your_score[j],100+135*j,170);
        }
        else 
        {
          textFont(font1);
          text("輸入錯誤",50+135*j,170);
          
        }
      }
    }
  }
}
void stage1()
{
  background(255);
  
}
void stage(int x)
{
  if(x==0) 
    stage0();
  else if(x==1)
    stage1();
}
void caltext(String words, int x, int y)
{
    textFont(font1);
    float w=textWidth(words); 
    fill(0);
    text(words,x,y+30);
    noFill();
    rect(x,y,w,40,7);
}
void buttontext(String words, int x, int y)
{
    textFont(font1);
    float w=textWidth(words); 
    fill(0);
    text(words,x,y+30);
    noFill();
    rect(x,y,w,40);
}
void mousePressed()
{
  if(now==0)
  {
    if(40<=mouseX && mouseX<=170 && 140<=mouseY && mouseY<=180)
    {
      your_score[0]=int(input);
      usual_score[who]=your_score[0];
      cal_score[0]=your_score[0];
      now_input=1;
    }
    if(170<=mouseX && mouseX<=310 && 140<=mouseY && mouseY<=180)
    {
      your_score[1]=int(input);
      usual_percent[who]=your_score[1];
      cal_score[1]=your_score[1]/100;
      now_input=2;
    }
    if(310<=mouseX && mouseX<=445 && 140<=mouseY && mouseY<=180)
    {
      your_score[2]=int(input);
      minterm_score[who]=your_score[2];
      cal_score[2]=your_score[2];
      now_input=3;
    }
    if(445<=mouseX && mouseX<=580 && 140<=mouseY && mouseY<=180)
    {
      your_score[3]=int(input);
      minterm_percent[who]=your_score[3];
      cal_score[3]=your_score[3]/100;
      now_input=4;
    }
    if(580<=mouseX && mouseX<=715 && 140<=mouseY && mouseY<=180)
    {
      your_score[4]=int(input);
      final_score[who]=your_score[4];
      cal_score[4]=your_score[4];
      now_input=5;
    }
    if(715<=mouseX && mouseX<=850 && 140<=mouseY && mouseY<=180)
    {
      your_score[5]=int(input);
      final_percent[who]=your_score[5];
      cal_score[5]=your_score[5]/100;
      now_input=6;
    }

   
  }
}
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
  { //按下 Enter 鍵, 表示執行
    
  } 
  else if (key==CODED) 
  { //按下特殊鍵, 如 SHIFT, CTRL, ALT 等
    //Do nothing, 不記錄CODED特殊鍵
  } 
  else if('0'<=key && key<='9' || key=='-')
  { //如果按下 普通字母/符號按鍵, 記錄下來
    input += key; //記錄下來
  }
  else if(key == '*')
  {
    for(int i=0;i<5;i++)
      your_score[i]=0;
  }
}
