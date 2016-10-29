/**
 *  
 *  This project require the library <a href="http://www.ricardmarxer.com/geomerative">Geomerative</a>.
 */

import fisica.*;
import geomerative.*;

FWorld world;
int gameState=0;

PImage startBackgroundImage;
PImage gameBackgroundImage;
PImage endBackgroundImage;
PImage[] startText;
PImage endText;
int startTextIndex=0;

String filename = "winged_star.svg";

PVector force;

FSVG obj;
FCircle[] planets = new FCircle[4];
FCircle energyBall;

void setup(){
  size(1080, 720);
  
  
  startBackgroundImage=loadImage("backgroundImage.jpg");
  gameBackgroundImage=loadImage("spacebghd.jpg");
  endBackgroundImage=loadImage("cityspacebackground.jpg");
  endText = loadImage("endText1.png");
  
  startText=new PImage[4];
  
  startText[0]=loadImage("startText1.png");
  startText[1]=loadImage("startText2.png");
  startText[2]=loadImage("startText3.png");
  startText[3]=loadImage("startText4.png");
  
  startTextIndex=0;
  
  fuelImage=loadImage("feulbar.png");
  
  smooth();
  
  frameRate(60);
  Fisica.init(this);
  Fisica.setScale(10);
  
  RG.init(this);
  
  world = new FWorld();
  world.setEdges(this, color(255));
  world.setGravity(0, 0);
  
  for (int i =0;i<4;i++)
  {
    planets[i]= new FCircle(random(50,200));
    planets[i].setStatic(true);
    planets[i].setPosition(random(10,width-10),random(10,height-10));
    while (planets[i].getContacts().size()>0){
      println("contact");
    planets[i].setPosition(random(10,width-10),
                          random(10,height-10));
  }
    world.add(planets[i]);
  }
  PImage planet0=loadImage("planet0.png");
  planet0.resize(int(planets[0].getSize()),int(planets[0].getSize()));
  PImage planet1=loadImage("planet1.png");
  planet1.resize(int(planets[1].getSize()),int(planets[1].getSize()));
  PImage planet2=loadImage("planet2.png");
  planet2.resize(int(planets[2].getSize()),int(planets[2].getSize()));
  PImage planet3=loadImage("planet3.png");
  planet3.resize(int(planets[3].getSize()),int(planets[3].getSize()));
  
  planets[0].attachImage(planet0);
  planets[1].attachImage(planet1);
  planets[2].attachImage(planet2);
  planets[3].attachImage(planet3);
  
  explosionImage= loadImage("explosion.png");
  
  energyBall= new FCircle(60);
  energyBall.setPosition(random(100,width-100),random(100,height-100));

  while (energyBall.getContacts().size()>0){
    energyBall.setPosition(random(100,width-100),
                          random(100,height-100));
  }
  energyBall.setStatic(true);
  
  PImage energyBallImage=loadImage("energyFireBall.png");
  energyBallImage.resize(60,60);
  energyBall.attachImage(energyBallImage);
  
  world.add(energyBall);
  
  force = new PVector(0,0);
  println(force.x, force.y);
  
  createWingedStar(width/2, height/2);
}

void draw(){
  background(255);

  switch(gameState){
    case 0:
      gameStart();
    break;
    case 1:
      gameMove();
    break;
    case 2:
      gameEnd();
    break;
  }
}


void createWingedStar(float x, float y) {
  float angle = random(TWO_PI);
  float magnitude = 200;
  
  obj = new FSVG(filename);
  obj.setPosition(x, y);
  obj.setRotation(angle+PI/2);
  obj.setVelocity(magnitude*cos(angle), magnitude*sin(angle));
  obj.setDamping(0);
  obj.setRestitution(0.5);
  world.add(obj);
}

