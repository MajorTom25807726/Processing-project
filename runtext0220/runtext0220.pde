/*柴奴跑馬燈綠色*/
PFont font1;
void setup()
{
  size(600,200);
  font1 = createFont("微軟正黑體",80);
}
int rtxt=0;
void draw()
{
  background(0);
  rtxt = (rtxt+5) % 1000;
  fill(#00FF00);
  textFont(font1);
  text("ㄔㄋ我愛你",600-rtxt,100);
}
