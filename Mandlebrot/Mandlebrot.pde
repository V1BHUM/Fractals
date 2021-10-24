//author : vibhu
//use the arrow keys and +- to move and mouse to change maxIter and maxMod
boolean rgb = false;

double factor1 = 0.03,factor2 = 0.09;
double ox = 0,oy = 0;
double xwidth = 4;
int maxIter = 20;
int maxMod = 12;

double xmin,xmax;
double ymax ,ymin;

void setup()
{
  size(600,400);
  //fullScreen();
  calc();
  if(!rgb)
  colorMode(HSB);
  loadPixels();
}

void calc()
{
  if(xwidth>5)
  xwidth = 5;
  xmin = ox-xwidth/2;
  xmax = ox+xwidth/2;
  double ywidth = ((xwidth/width)*height);
  ymin = oy-ywidth/2;
  ymax = oy+ywidth/2; 
}

void keyPressed()
{
  println(keyCode+" [ "+ox+" , "+oy+" ] [ "+xwidth+" ]");
   switch(keyCode)
   {
     case LEFT:
     ox-=factor1*xwidth;
     break;
     
     case UP:
     oy-=factor1*xwidth;
     break;
     
     case RIGHT:
     ox+=factor1*xwidth;
     break;
     
     case DOWN:
     oy+=factor1*xwidth;
     break;
     
     case 109:
     xwidth+=factor2*xwidth;
     break;
     
     case 107:
     xwidth-=factor2*xwidth;
     break;
   }
   calc();
}

double dmap(double x,double a,double b,double A,double B)
{
   return  A + ((x-a)/(b-a))*(B-A);
}

void draw()
{
  //translate(width/2,height/2);
  background(51);
  maxMod = (int)map(mouseY,0,height,6,100);
  maxIter = (int)map(mouseX,0,height,10,200);
  for(int x = -width/2;x<width/2;x++)
  {
     for(int y = -height/2;y<height/2;y++)
     {
        double a = dmap(x, -width/2,width/2,xmin,xmax);
        double b = dmap(y, -height/2,height/2,ymin,ymax);
        complex c = new complex(a,b);
        complex z = new complex(0,0);
        int k = 0;
        while(k<maxIter)
        {
           z.add(c);
           z.mult(z);
           if(z.mod2()>maxMod)
             break;
             k++;
        }
        
        color fin;
        
        if(rgb)
          fin = color(map(k,0,maxIter,255,0));
        else
        {
          int val = 255;
          if(k==maxIter)
            val = 0;
          fin = (color(map(k,0,maxIter,255,0),val,val));
        }
        pixels[x+width/2+(y+height/2)*width] = fin;
     }
     updatePixels();
  }
}
