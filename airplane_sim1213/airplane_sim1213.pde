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
  if(stage==4)
    imageMode(CENTER);
}
int stage=0,per=0,countdown=0,angle=0,da=0;
String tx= "Press to continue";
float x=0,y=0;
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

void stage4()
{
  background(#46E3F0);
  pushMatrix();
    translate(x,y);
    rotate(radians(angle));
    image(plane[0],430,200,240,160);
  popMatrix();
  angle+=da;
  if(10<angle && angle<=14 || -10<angle && angle<=-14)
  {
       player1.rewind();
       player1.play();
  }
  else if(angle>=15 && angle>=-15)
  {
      player2.rewind();
      player2.play();
  }
  print("angle="+angle);
  println("x="+x+"y="+y);
}
void time()
{
  int s = second(),m = minute(),h = hour();
  int d = day(),mon = month(),y = year();
  textFont(font1);
  if(s<10)
  {
    if(h>12 && h-12<10)
      text("下午"+"0"+(h-12)+":"+m+":0"+s,770,570);
    else if(h>12)
      text("下午"+(h-12)+":"+m+":0"+s,770,570);
    else if(h==12)
      text("下午"+h+":"+m+":0"+s,770,570);
    else if(h==0)
      text("上午"+(h+12)+":"+m+":0"+s,770,570); 
    else if(h<10)
      text("上午"+"0"+h+":"+m+":0"+s,770,570); 
    else
      text("上午"+h+":"+m+":0"+s,770,570); 
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
}
void buttontext(String words, int x, int y)
{
  textSize(20);
  float w=textWidth(words); 
  fill(0);
  text(words,x,y+30);
  noFill();
  rect(x,y,w,40);
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
  //else
    //stage=0;
}
void mouseReleased()
{
  
}
void keyPressed()
{
  if(keyCode==UP) da=1;
  if(keyCode==DOWN) da=-1;
}
void keyReleased()
{  
 da=0; 
}
