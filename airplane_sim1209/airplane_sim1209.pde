PImage img1,img2;
void setup()
{
  size(900,600);
  img1= loadImage("windowxp.jpg");
  img2= loadImage("airplane_sim_appicon.png");
}

void draw()
{
  image(img1,0,0);
  image(img2,10,25,50,50);
  textSize(15);
  text("Airplane\nSimulation",10,100);
  fill(#00FF00);
  text(mouseX + " " + mouseY,mouseX,mouseY);
  fill(0);
  rect (0,540, 900,150);
  fill(255);
  time();
}
void time()
{
  int s = second(),m = minute(),h = hour();
  int d = day(),mon = month(),y = year();
  textSize(20);
  if(h>=12)
    text("PM"+(h-12)+":"+m+":"+s,770,570);
  else
    text("AM"+h+":"+m+":"+s,770,570); 
  text(y+"/"+mon+"/"+d,770,590);
}
