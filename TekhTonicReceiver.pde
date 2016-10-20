import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

private float oscSpeed = 0;
private float handX = 0;
private float handY = 0;

void setup() 
{
  size(400,400);
  frameRate(100);
  oscP5 = new OscP5(this,9002);
}


void draw() 
{
  background(0);
  ellipse( (float)width*handX, height-(float)height*handY, oscSpeed*200, oscSpeed*200 );
}



void oscEvent( OscMessage msg ) 
{
  //println( "Received OSC message "+ msg.addrPattern() +" : "+ msg.get(0).floatValue() );
  if( msg.addrPattern().equals( "/tekhtonic/hand/speed" ) ){
    oscSpeed = msg.get(0).floatValue();
  }
  
  if( msg.addrPattern().equals( "/tekhtonic/hand/pos/x" ) ){
    handX = msg.get(0).floatValue();
  }
  
  if( msg.addrPattern().equals( "/tekhtonic/hand/pos/y" ) ){
    handY = msg.get(0).floatValue();
  }
}