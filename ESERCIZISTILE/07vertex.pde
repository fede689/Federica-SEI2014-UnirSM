// Drawing tool for school project
// © Federica Capotosti for the course SEI2014 @ UnirSM  
// Didactic purpose, MIT License, March 2014, San Marino

Brush pennello;
 
void setup() {
  size(1000, 800); // window size
  rectMode(CENTER); //mode to draw from center
  noStroke(); // without stroke
  background(255); // white background
  smooth();
  pennello = new Brush(2); // create an instance
}
 
void draw () {
  // draw
}
 
void keyPressed() {
  if (key == 'c') { background(255); } //to cancel the background with the key "c"
}
 
void mouseDragged () {    //trascinamento del mouse
  pennello.move(mouseX, mouseY);
  pennello.draw();
}
 
class Brush {
  int xBrushPos;    // x-coordinate of the brush
  int yBrushPos;    // y-coordinate of the brush
  int bSize;
 
  Brush(int bSize) {
    this.bSize = bSize; // set brushSize
  }
 
  // move brush to its desired location
  void move(int newX, int newY) {
    xBrushPos = newX;
    yBrushPos = newY;
  }
 
  // draws brush with more element
  void draw() {
    // use random to make the colors and positioning 
    fill(100, random(100), 100);
    rect (xBrushPos, yBrushPos, bSize*random(3), bSize*random(3));
    fill(0, 15, 200);
    ellipse (xBrushPos, yBrushPos, bSize, bSize);
    fill(0, 0, 219);
    ellipse (xBrushPos+random(-bSize, bSize), yBrushPos+random(-bSize, bSize), bSize/2, bSize/2);
  }
}

















