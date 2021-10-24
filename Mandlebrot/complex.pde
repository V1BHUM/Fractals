class complex
{
   double x;
   double y; 
   
   complex(double x,double y)
   {
      this.x = x;
      this.y = y;
   }
   
   void add(complex c)
   {
      x+=c.x;
      y+=c.y; 
   }
   
   void mult(complex c)
   {
      double X = this.x*c.x - this.y*c.y;
      double Y = this.x*c.y + this.y*c.x;
      x = X;
      y = Y;
   }
   
   double mod2()
   {
      return x*x+y*y; 
   }
}
