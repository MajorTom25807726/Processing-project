import ddf.minim.*;
Minim minim;
PImage img1,img2,plane[],cloud;
PFont font1,font2,font3;
AudioPlayer player1,player2;
void setup()
{
  frameRate(10);
  int ps=4;
  size(900,600);
  img1= loadImage("windowxp.jpg");
  img2= loadImage("airplane_sim_appicon.png");
  cloud = loadImage("cloud.png");
  plane = new PImage[ps];
  for(int i=0;i<ps;i++)
  {
    plane[i]=loadImage("plane"+i+".png");
  }
  font1 = createFont("微軟正黑體",20);
  font2 = createFont("Consolas",50);
  font3 = createFont("Microsoft Sans Serif",40);
  minim = new Minim(this);
  player1 = minim.loadFile("737bank_angle.mp3");
  player2 = minim.loadFile("737stall_warning.mp3");
    
}
int stage=0,per=0,countdown=0,da=0,fs=0;
String tx= "Press to continue";
float px=256,py=139,angle=0,va=0,vx=0,vy=0,f=300,hig=1000;
//x=429,y=296
void draw()
{
  stage(stage);
}
void stage0()
{
  image(img1,0,0);
  image(img2,10,25,50,50);
  textSize(15);
  text("Airplane\nSimulation",10,100);
  fill(#00FF00);
  
  fill(0);
  rect (0,540, 900,150);
  fill(255);
  time();  
}

void stage1()
{
  
  background(128);   
  fill(255);
  textAlign(CENTER);
  text(tx, 450,300); 
}

void stage2()
{
    per = (per + 1) % 100;
    background(128);
    fill(255);
    textAlign(LEFT);
    background(0, 0, 0); // black 
    textSize(30);
    text("Loading ... " + per + " %", 900 / 4, 600 / 2.5);
    rect(900 / 4, 600 / 2, per * 2, 20, 7);
    if(per==99)
      stage=3;
}

void stage3()
{
  per = (per + 2) % 900;
  background(#0DCCFF);
  image(cloud,per,200,820/3,576/3);
  text(mouseX + " " + mouseY,mouseX,mouseY);
  textFont(font2);
  text("Airplane_Simulator",200,200);
  textFont(font3);
  buttontext("Departure",300,400);
  buttontext("Exit",300,460);
}
int time1=0, time2=0,ENG1=0;
void stage4()
{  
  imageMode(CENTER);
  background(#46E3F0);
  if(f-(fs*0.1)<150)
  {
    fill(0);
    textFont(font1);
    fill(#FF0022);
    text("燃油不足",470,430);
  }
  noFill();
  rect(700,500,500,200);
  fill(0);
  line(600,400,600,600);
  fill(0);
  text("ENG1",300,458);
  text(mouseX + " " + mouseY,mouseX,mouseY);
  fill(#D913E8);
  stroke(0);
  rect(200,500,100,100,7);  
  if(f-(fs*0.1)>0)
  {
    fill(#1EE859);//油量
    stroke(0);
    rect(200,600,100,f-(fs*0.1),7);
  }
  else
    hig-=1;
  if(angle>0)
    hig--;
  else if(angle==0)
   hig+=0;
  else
    hig++;
  if(hig>0)
  {
    textFont(font1);
    fill(0);
    text("高度:"+hig,620,430);   
  }
  else if(hig<=200)
    line(0,hig+300,900,hig+300);
  else if(hig<=0)
  {
   stage(5);
  }
  
  if(ENG1%2==1)
  {
    buttontext("ON",330,500);
    fs+=1;
  }
  else
    buttontext("OFF",330,500);
  pushMatrix();
    translate(px,py);// px=429,py=296->新原點
    rotate(radians(angle));   
    image(plane[0],0,0,240,123);
    pushMatrix();
      translate(-78,-20);
      rotate(radians(va));    
      fill(#8E8484);
      stroke(0);
      rectMode(CENTER);
      rect(0,0,20,5);
    popMatrix();
  popMatrix();
  angle+=va/10;
  vx=cos(radians(angle+va/10));
  vy=sin(radians(angle+va/10));
  px+=vx/10;
  py+=vy/10;
  if(25<=angle && angle<30)
  {
     if(time1==0) {
       player1.rewind();
       player1.play();
       time1=55;
     }
  }
  else if(-25>=angle && angle>-30)
  {
     if(time1==0) {
       player1.rewind();
       player1.play();
       time1=55;
     }
  }
  else if(angle>=30 || angle<=-30)
  {
    if(time2==0) {
      player2.rewind();
      player2.play();
      time2=55;
    }
  }
  if(time1>0) time1--;
  if(time2>0) time2--;
  print("ang="+angle);
  println("fn="+(f-(fs*0.1))+"px="+px+"py="+py);
}
void stage5()
{
  background(0);
  fill(#FF0022);
  text("你正在地下飛行",500,500);
}
void time()
{
  int s = second(),m = minute(),h = hour();
  int d = day(),mon = month(),y = year();
  textFont(font1);
  if(s<10)
  {
    if(m<10)
    {      
      if(h>12 && h-12<10)
        text("下午"+"0"+(h-12)+":0"+m+":0"+s,770,570);
      else if(h>12)
        text("下午"+(h-12)+":0"+m+":0"+s,770,570);
      else if(h==12)
        text("下午"+h+":0"+m+":0"+s,770,570);
      else if(h==0)
        text("上午"+(h+12)+":0"+m+":0"+s,770,570); 
      else if(h<10)
        text("上午"+"0"+h+":0"+m+":0"+s,770,570); 
      else
        text("上午"+h+":0"+m+":0"+s,770,570);
    }
  }
  else
  {
    if(m<10)
    {      
      if(h>12 && h-12<10)
        text("下午"+"0"+(h-12)+":0"+m+":"+s,770,570);
      else if(h>12)
        text("下午"+(h-12)+":0"+m+":"+s,770,570);
      else if(h==12)
        text("下午"+h+":0"+m+":"+s,770,570);
      else if(h==0)
        text("上午"+(h+12)+":0"+m+":"+s,770,570); 
      else if(h<10)
        text("上午"+"0"+h+":0"+m+":"+s,770,570); 
      else
        text("上午"+h+":0"+m+":"+s,770,570);
    }
    else
    {
      if(h>12 && h-12<10)
        text("下午"+"0"+(h-12)+":"+m+":"+s,770,570);
      else if(h>12)
        text("下午"+(h-12)+":"+m+":"+s,770,570);
      else if(h==12)
        text("下午"+h+":"+m+":"+s,770,570);
      else if(h==0)
        text("上午"+(h+12)+":"+m+":"+s,770,570); 
      else if(h<10)
        text("上午"+"0"+h+":"+m+":"+s,770,570); 
      else
        text("上午"+h+":"+m+":"+s,770,570); 
    }
  }
  text(y+"/"+mon+"/"+d,780,590);
}
void stage(int x)
{
  if(x==0) 
    stage0();
  else if(x==1)
    stage1();
  else if(x==2)
    stage2();
  else if(x==3)
    stage3();
  else if(x==4)
    stage4();
  else if(x==5)
    stage5();
  
}
void buttontext(String words, int x, int y)
{
  if(stage<4)
  {
    textSize(20);
    float w=textWidth(words); 
    fill(0);
    text(words,x,y+30);
    noFill();
    rect(x,y,w,40);
  }
  else
  {
    if(ENG1%2==1)
    {
       textSize(20);
       fill(#FF0026);
       textAlign(LEFT);
       text(words,x-15,y);
       noFill();
       stroke(#FF0026);
       rect(x,y,60,40,5);
    }
    else if(ENG1%2==0)
    {
       textSize(20);
       fill(#FFE80F);
       textAlign(LEFT);
       text(words,x-15,y);
       noFill();
       stroke(#FFE80F);
       rect(x,y,60,40,5);
    }
  }
  
}
void mousePressed()
{
  if(stage==0 && 10<mouseX && mouseX<55 && 24<mouseY && mouseY<74)
    stage=1;
  else if(stage==1 && mousePressed)
    stage=2;
  else if(stage==3  && 300<mouseX && mouseX<330 && 460<mouseY && mouseY<496)
    stage=0;
  else if(stage==3 && 300<mouseX && mouseX<387 && 400<mouseY && mouseY<440)
    stage=4;
}
void mouseReleased()
{
  
}
void keyPressed()
{
  if(keyCode==UP && va>-20) va--;
  if(keyCode==DOWN && va<20) va++;
  if(key==49 && stage==4) ENG1++;
}
void keyReleased()
{  
 
}
