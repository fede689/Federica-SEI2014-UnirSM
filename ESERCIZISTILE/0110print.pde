// Drawing tool for school project
// © Federica Capotosti for the course SEI2014 @ UnirSM  
// Didactic purpose, MIT License, March 2014, San Marino



size(1020, 680);
noStroke();
//sfondo viola 
background(60, 12, 50);

int rows = int(pow(2, int(random(1, 5))));
int u = height / (rows + 4);
int thickness = int(pow(2, int(random(1, 4))));
int uth1 = u / thickness;
int uth2 = u + uth1;
int startX = int(-u * 0.75);
int startY = height/2 - rows/2 * u;
int endX = width+u;
int endY = height/2 + rows/2 * u;
for (int x = startX; x < endX; x += uth1) {
  for (int y = startY; y < endY; y += uth2) {
    if (random(1) > 0.5) {
      fill(255);
      quad(x, y, x+u, y+u, x+uth2, y+u, x+uth1, y);
    }
    else {
      fill(0);
      quad(x, y+u, x+u, y, x+uth2, y, x+uth1, y+u);
    }
  }
}
