boolean saveF, showPoint, savePDF, showForce = false;
boolean reDraw = true;
boolean recordPDF = false;

boolean shouldDraw;
boolean hasDrawn;
float minSize = 0.3; //say min size of elements
int maxSize = 20; //say max size of elements
int radius = 15; //make circular square

//different color of background from the start to the end 
color startBG = color(0,0,0);
color endBG = color(0,0,0);

//velocity of moving element
float velocityConstant = 0.02;

//creating class of element
class Rectangle
{
  PVector position;
  PVector rotation;
  PVector velocity;
  float w;
  float h;
  float r;
  color c;
}

ArrayList <Rectangle> rectangles;



void setup()
{
  size(1280, 720);
  background(255);
  //background(startBG);
  rectMode(CENTER);
  rectangles = new ArrayList<Rectangle>();
}



void draw()
{
  update(); //reference to the update
  background(lerpColor(startBG, endBG, (1 + sin(millis() * 0.0001)) / 2));
  
  for (Rectangle r : rectangles)
  {
  noStroke();
  pushMatrix();
  translate(r.position.x, r.position.y); //changing of rect position
  rotate(r.rotation.z); //changing of rect rotation 
  fill(r.c);  
  rect(0, 0, r.w, r.h, r.r); 
  popMatrix();
}

//to make a video
    if (key =='s' || key =='S') {
      saveFrame("Animation01/anim-####.tga");
      println(frameCount);
    }
    if (savePDF) {
      endRecord();
      savePDF = false;
    }

    if (saveF) {
      saveFrame("frame-#######.tga");
    }
}


//UPDATE to define when the brush draws or not
void update()
{
  if (shouldDraw && !hasDrawn)
  {
    drawBrushEffect();
  }

  for (Rectangle r : rectangles)
  {
    if (r.position.x < 0)
    {
      r.position.x = 1;
      r.velocity = calcReflection(r.velocity, fromAngle(90));
    }
    else if (r.position.y < 0)
    {
      r.position.y = 1;
      r.velocity = calcReflection(r.velocity, fromAngle(360));
    }
    else if (r.position.x > width)
    {
      r.position.x = width - 1;
      r.velocity = calcReflection(r.velocity, fromAngle(270));
    }
    else if (r.position.y > height)
    {
      r.position.y = height -1;
      r.velocity = calcReflection(r.velocity, fromAngle(180));
    }

    r.position.add(PVector.mult(r.velocity, velocityConstant));
  }
}

PVector fromAngle(float angle)
{
  return new PVector(cos(radians(angle)), sin(radians(angle)));
}

PVector calcReflection(PVector v, PVector n)
{
  return PVector.sub(PVector.mult(n, ( 2 * PVector.dot(v, n)/PVector.dot(n, n))), v);
}


//have drawing only with mouse pressed
void mousePressed()
{
  shouldDraw = true;
}

void mouseReleased()
{
  shouldDraw = false;
}

void mouseMoved()
{
  hasDrawn = false;
}

void mouseDragged()
{
  hasDrawn = false;
}


//effects of elements
void drawBrushEffect()
{
  Rectangle r = new Rectangle();
  r.c = color(188, 26, 37, random(200));//red color with random opacity
  float randSize = minSize + random(maxSize);   //random size of elements 
  r.position = new PVector(mouseX + random(maxSize), mouseY + random(maxSize), 0);
  r.w = randSize;
  r.h = randSize;
  r.r = radius;
  r.rotation = new PVector(0.0, 0.0, radians(random(0, 360)));
  r.velocity = fromAngle(random(0, 360));
  rectangles.add(r);
  hasDrawn = true;
}



void keyReleased() {
  if (key == DELETE || key == BACKSPACE) 
  background(255); 

  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "####.pdf");
      println("recording started");
      recordPDF = true;
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
    }
  }
    }
