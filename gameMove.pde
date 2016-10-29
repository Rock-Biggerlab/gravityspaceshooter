
void gameMove(){
  image(gameBackgroundImage,0,0,width,height);
  world.draw(this);
  world.step();
  showUI();
  
  if (obj.getContacts().size()>0)
  {
    if(energyBall.getContacts().size()>0){
      addEnergy();
      energyBall.setPosition(random(100,width-100),
                            random(100,height-100));
    }
    else
    {
      explode();
    }
    
  }
      
  if (mousePressed)
  {
    showPlanets();
    
    calculateForce();
    obj.addImpulse(force.x,force.y);
  }
  else fadePlanets();
}

void showPlanets(){
  for (int i=0;i<4;i++)
  {
    planets[i].setImageAlpha(255);
  }
}

void addEnergy(){
  energyPoints+=10;
}

void explode(){
  println("explode!!!!");
}

void fadePlanets(){
  for (int i=0;i<4;i++)
  {
    planets[i].setImageAlpha(127);
  }

}
