float manualMoveUnit = 100;

void mousePressed(){

}


//manual movement

void keyPressed()
{
  switch (gameState){
    case 0:
       if (key==' ')
      {
        startTextIndex++;
      }
      
      if (startTextIndex==4 && key==' ')
      {
        gameState++;
        startTextIndex=0;
      }
    break;
    case 1:
      if (key==CODED&&fuelLevel>0)
      {
        fuelLevel-=5;
        switch(keyCode){
        case LEFT:
          obj.addImpulse(-manualMoveUnit,0);
        break;
        case RIGHT:
          obj.addImpulse(manualMoveUnit,0);        
        break;
        case UP:
          obj.addImpulse(0,-manualMoveUnit);
        break;
        case DOWN:
          obj.addImpulse(0,manualMoveUnit);
        break;
        }
      }
    break;
    case 2:
      if (key==' ')
      {
        gameState=1;
      }
    break;
    }
  
}

