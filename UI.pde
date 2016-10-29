int fuelLevel=1000;
int energyPoints=0;

PImage fuelImage;

void showUI(){
  image(fuelImage,0,0,250,60);
  
  colorMode(HSB,100);
  noStroke();
  fill(map(fuelLevel,0,1000,100,30),100,100);
  rect(65,24, map(fuelLevel,0,1000,0,164),20);
  colorMode(RGB,255);
  noFill();
  
  fill(255);
  textSize(30);
  text("Energy Collected: ", 20,100);
  text(energyPoints,300,100);
}
