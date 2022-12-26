void setup(){
  size(1920,1080);
  background(0);
  move();
}
boolean play=false,reset=false,down=true;
int white=255;
float mass=10;
float fps=60;
float x0=200,y0=200,x=x0,y=y0,r=50,g=9.8,h=5,u=0,v=0,time=0,pulse=1.0/60,mapvalue=0,h1=h;
float recoil=50;//percent
float totaltime=(float)Math.sqrt(2*h/g);
float dsplcmnt;
float ke=0;
void draw(){
  mapvalue=(height-y0)/h;
  if(play){
    move();
    //print(v+" ");
  }
  if(reset){
  reset();
  reset=false;
  }
  if(u<=0){
  h1=(height-y)/mapvalue;
  print(h1+" ");
  down=true;
  }
  if(y+r/2>=height){
    bounceback();
    //play=false;
  }else{
    //print(y+r+" ");
  }
}
void bounceback(){
  //(ke*recoil/100)/(mass*g))
  
  u=(float)Math.sqrt((recoil/100)*h1*g*2);
  //print(u+" ");
  v=0;
  //g*=-1;
  //dsplcmnt=0;
  down=false;
}
void reset(){
  x=x0;
  y=y0;
  //
  u=0;
  play=false;
  //
  move();
}
void move(){
  background(0);
    ke=0.5*mass*v*v;
  dsplcmnt=u*pulse+0.5*g*pulse*pulse;
  dsplcmnt=mapvalue*dsplcmnt;
  fill(255);
  if(down)
  y+=dsplcmnt;
  else
  y-=dsplcmnt;
  circle(x,y,r);
  x+=4;
  //stroke(255);
  //strokeWeight(4);
  //point(y,x);
  //x+=3;
  if(down)
  v=u+g*pulse;
  else
  v=u-g*pulse;
  u=v;
}
void keyPressed(){
  print(key==' ');
  if(key==' '&&y+r/2<height){
    play=true;
  }
  if(key==49){
    reset=true;
  }
}
