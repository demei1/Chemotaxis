class Stickmen {
int myX, myY,myRotation;
boolean directionLeft, directionRight;
Stickmen (int x, int y){
 myX = x;
 myY = y;
 directionLeft = false;
  }
  void move(){
    if (mouseX < width/2){
    myX = myX + (int)(Math.random()*1)-3;
    directionLeft = true;
    }
    if (mouseX > width/2){
    myX = myX + (int)(Math.random()*3)+1;
    directionLeft = false;
    }
    
    myX = myX + (int)(Math.random()*3)-1;
    myY = myY + (int)(Math.random()*3)-1;
    myRotation = (int)(Math.random()*180)-90;
   
   if (myX > 800 || myX < 0 || myY > 800|| myY < 0){
     myX = (int)(Math.random()*width);
     myY = (int)(Math.random()*height);
   }
   
  }
  void show(){
    color (255,0,0);
    //center of person
    translate (myX, myY);
    //head
    fill(255);
    ellipse (0, -50, 50,50);
    //text bubble
    if (directionLeft == true){
    fill(0);
    textSize(20);
    text("Guys, we gotta go left!", 75, -75); 
    }
    if (directionLeft == false){
    fill(0);
    textSize(20);
    text("Guys, we need to go to the right!", 75, -75); 
    }
    //arms
    line ( -25, -12, 25,  -12);
    //body
    line (0,0, 0, - 25);
    //legs
    rotate( radians(myRotation));
    line (0, 0, 25, 25);
    line (0, 0, -25, 25);
    resetMatrix();
  }
 

};// end of class
Stickmen [] stickyArmy;


void setup(){
  size (800,800);
   stickyArmy = new Stickmen[5];
  for (int i = 0; i < stickyArmy.length; i++){
   stickyArmy[i] = new Stickmen((int)(Math.random()*width), ((int)(Math.random()*height)));
  }
}

void draw(){
  background(255);
  for (int i = 0; i < stickyArmy.length; i++){
  stickyArmy[i].move();
  stickyArmy[i].show();
  }
 
}
