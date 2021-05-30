void setup()
{
  size(500,500);  
}
int sw=0;
int sum=0;
int m=0;
int s=0;
void draw()
{
  background(255);
  if(sw==1 && sum>0)
    sum--;
  m=sum/3600;
  s=sum/60%60;
  fill(0);
  textSize(30);
  text(m+":"+s,100,100);
  
}
void keyPressed()
{
  if(key=='i')
    sum+=3600;
  if(key=='k'&& sum>=60)
    sum-=3600;
  if(key=='o')
    sum+=60;
  if(key=='l'&& sum>=1)
    sum-=60;
  if(key=='*')
    sw=1;
     
}
