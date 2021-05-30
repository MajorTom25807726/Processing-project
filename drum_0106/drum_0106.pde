import ddf.minim.*;
Minim minim;
AudioPlayer player1,player2,player3,player4;
void setup()
{
  minim = new Minim(this);
  player1 = minim.loadFile("big drum.mp3");
  player2 = minim.loadFile("tata.mp3");
  player3 = minim.loadFile("snare.mp3");
  player4 = minim.loadFile("lone crash.mp3");
}
int sw1=0,sw2=0,sw3=0,sw4=0;
int time1=0,time2=0,time3=0,time4=0;
void draw()
{
  if(sw1==1)
  {   
    if(time1==0) {
       player1.rewind();
       player1.play();
       time1=1;
   }
    sw1=0;
  }
  if(sw2==1)
  {   
    if(time2==0) {
       player2.rewind();
       player2.play();
       time2=1;
   }
    sw2=0;
  }
  if(sw3==1)
  {   
    if(time3==0) {
       player3.rewind();
       player3.play();
       time3=1;
   }
    sw3=0;
  }
  if(sw4==1)
  {   
    if(time4==0) {
       player4.rewind();
       player4.play();
       time3=1;
   }
    sw4=0;
  }
  if(time1>0) time1--;
  if(time2>0) time2--;
  if(time3>0) time3--;
  if(time4>0) time4--;
  println("sw1="+sw1+"sw2="+sw2+"sw3="+sw3+"sw4="+sw4);
}
void keyPressed()
{
  if(key==49)
    sw1=1;
  if(key==50)
    sw2=1;
  if(key==51)
    sw3=1;
  if(key==52)
    sw4=1;
    
}
