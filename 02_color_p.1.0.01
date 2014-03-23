// P_1_0_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * changing colors and size by moving the mouse
 * 	 
 * MOUSE
 * position x          : size
 * position y          : color
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 */

import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;


void setup() {
  size(720, 720);
  noCursor();
  //i colori sono random
  colorMode(RGB, random(255), random(255), random (255));
}


void draw() {
  // this line will start pdf export, if the variable savePDF was set to true 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

 //modalità di disegno dei cerchi dal centro
 ellipseMode(CENTER); 
  
  //no contorno
  noStroke(); 
  
  //sfondo cambia il primo valore in base al movimento del mouse sull'asse y
  background(mouseY/10, 100, 100);

  //riempimento
  fill(360-mouseY/3, 100, 100);
  
  //disegno i cerchi che cambiano dimensione in base alla posizione del mouse sull'asse x
  ellipse(360,360, mouseX+1, mouseX+1);
  ellipse(260,260, mouseX+1, mouseX+1);
  ellipse(460,460, mouseX+1, mouseX+1);
  ellipse(160,160, mouseX+1, mouseX+1);
  ellipse(560,560, mouseX+1, mouseX+1);
  ellipse(260,460, mouseX+1, mouseX+1);
  ellipse(460,260, mouseX+1, mouseX+1);
  ellipse(560,160, mouseX+1, mouseX+1);
  ellipse(160,560, mouseX+1, mouseX+1);
  ellipse(360,160, mouseX+1, mouseX+1);
  ellipse(160,360, mouseX+1, mouseX+1);
  ellipse(360,560, mouseX+1, mouseX+1);
  ellipse(560,360, mouseX+1, mouseX+1);
  
  
  
  // end of pdf recording
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}




void keyPressed() {
  //se premo "s" o "S" salvo immagine .png 
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  //se premo "p" o "P" salvo pdf
  if (key=='p' || key=='P') savePDF = true;
}


String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


