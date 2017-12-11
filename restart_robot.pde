float x = 0;
float y = 0;
float dx = 2;
float dy = 2;
 
float accx = 3;
float accy =3;
 
float bw = 150;
float bh = 30;
String bTxt = "START";
String rTxt="Restart";
float radEnemy = 30;
 
Boolean scene1 = true;
Boolean scene2 = false;
Boolean scene3 = false;
Boolean scene4=false;
// parameters for robot
float rw = 45;
float rh = 153;
 
void setup() {
  size(600, 600);
 
 
 
}
 
 
 
void draw() {
  background(255);
 
  if (scene2 == true) {
    // draw robot
    drawMycustomRobot(mouseX, mouseY, 52, 152, 219);
 
    x = x+accx*dx;
    y = y +accy*dy;
 
    if (x > width || x < 0)
    {
      accx = random(0.1, 5);
      dx = dx*-1;
    }
 
    if ( y > height || y < 0) {
      accy = random(0.1, 5);
      dy = dy*-1;
    }
 
 
 
    fill(0);
    noStroke();
    ellipse(x, y, radEnemy, radEnemy);
 
    // Check hit detection with robot and enemy ball
    if (mouseX + rw/2 > x-radEnemy/2 && mouseX - rw/2 < x + radEnemy/2
      && mouseY + rh/2> y - radEnemy/2 && mouseY - rh/2 < y + radEnemy/2) {
      scene3 = true;
      scene1 = false;
      scene2 = false;
 
      /// Play preloaded sound when it hits
  
 
 
  
  
    }
  }
 
  if (scene1 == true) {
    startButton();
  }
 
  // Scene 3 content
  if (scene3 == true) {
   fill(#03F9FF);
    rect(0, 0, width, height);
    restartButton();
  }
}
 
void restartButton(){
  pushMatrix();
  translate(width/2 - bw/2, height/2 - bh/2);
  fill(#004571);
 
 
  noStroke();
  rect(0, 0, bw, bh);
 
  fill(255);
  text(rTxt, bw/2 - textWidth(rTxt)/2, 18 );
  popMatrix();
}
void startButton() {
  background(#83FFA5);
  pushMatrix();
  translate(width/2 - bw/2, height/2 - bh/2);
  fill(#2ECC71);
 
 
  noStroke();
  rect(0, 0, bw, bh);
 
  fill(255);
  text(bTxt, bw/2 - textWidth(bTxt)/2, 18 );
  popMatrix();
}
 
void mousePressed() {
  if (mouseX > width/2 - bw/2 && mouseX < width/2 - bw/2 + bw
    && mouseY > height/2 - bh/2 && mouseY < height/2 - bh/2 + bh) {
    scene1 = false;
    scene2 = true;
    scene3 = false;
 
  }
}
 
void drawMycustomRobot(float xpos, float ypos, float r, float g, float b) {
  pushMatrix();
 
  //translate(mouseX,mouseY);
  translate(xpos - 120 + 25, ypos - 220 + 75);
  scale(0.5, 0.5);
 
 fill(#EA001B);
     strokeWeight(3);
  stroke(#000000);
  //draw head of robot
  fill(#0E4558);
  rect(125,150,250,50,4);
  fill(#62BAD8);
  //left eye
  line(175,120,200,150);
  line(200,120,200,150);
  line(225,120,200,150);
   ellipse(200,150,30,30);
  //right eye
  line(300,170,275,120);
  line(300,150,300,120);
  line(330,120,300,150);
  ellipse(200,150,50,50);
  ellipse(300,150,50,50);
  fill(#000405);
  ellipse(200,150,30,30);
  ellipse(300,150,30,30);
  fill(#416976);
  rect(230,170,30,20);
  fill(#0E4558);
  ellipse(165,300,70,70);
  ellipse(165,400,70,70);
  rect(130,300,70,100);
  ellipse(335,300,70,70);
  ellipse(335,400,70,70);
  rect(300,300,70,100);
//noStroke();
  rect(200,200,100,170);
 
 
  popMatrix();
}