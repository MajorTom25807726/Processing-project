PImage img[];
void setup()
{
  int sum=10;
  img = new PImage[sum];
  size(600,200);
  for(int i=0;i<sum;i++)
   img[i]=loadImage("num"+i+".png");
}
int time=6000;
void draw()
{
  background(255);
  fill(0);
  textSize(30);
  //text(mouseX + " " + mouseY,mouseX,mouseY);
  fill(#8E8E8E);
  rect(10,10,580,150,7);
  fill(255);
  rect(430,30,125,100,7);
  for(int i=0;i<3;i++)
  {
    if(time>4000)
    {  
      if(i==0)
      {
        fill(#00F000);
        ellipse(80+120*i,80,100,100);
      }
      else
      {
        fill(0);
        ellipse(80+120*i,80,100,100);
      }
    }
    else if(3000<=time && time<=4000)
     {
       if(i==1)
       {
         fill(#FFFF1C);
         ellipse(80+120*i,80,100,100);
       }
       else
       {
         fill(0);
         ellipse(80+120*i,80,100,100);
       }
        
    }
     else if(0<=time && time<=3000)
     {
      if(i==2)
      {
       fill(#CC0000);
       ellipse(80+120*i,80,100,100);
      }
      else
      {
         fill(0);
         ellipse(80+120*i,80,100,100);
      }
    }
    else
      ellipse(80+120*i,80,100,100);
  }
  if(time==0) 
  { 
    time=6000;
  }
  if(time>0) 
  {
    time--;
    image(img[time/1000],420,0,img[time/1000].width/1.2,img[time/1000].height/1.2);
    image(img[time%1000/100],470,0,img[time%1000/100].width/1.2,img[time%1000/100].height/1.2);  
    
  }
}
