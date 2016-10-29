
void calculateForce()
{
  force= new PVector(0.0,0.0);
  for (int i=0;i<4;i++)
  {
    PVector d=new PVector(planets[i].getX()-obj.getX(),
                          planets[i].getY()-obj.getY());
    float   distance = d.mag();
            d.normalize();
            println("d is", d);
            
    float   distancepow=pow(distance, 1.5);
    d.mult(pow(planets[i].getSize(),2.5));
    d.mult(1.0/distancepow);
    force.add(d);
  }
  println(force);
}
