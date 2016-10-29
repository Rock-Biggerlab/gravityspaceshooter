PImage explosionImage;


void gameEnd(){
  image(endBackgroundImage,0,0,width,height);
  image(explosionImage,200,200,218,189);
  image(endText,0,0,width,height);
  if (keyPressed && key==' ')
  {
    gameState=0;
  }

}

