// Drawing tool for school project
// © Federica Capotosti for the course SEI2014 @ UnirSM  
// Didactic purpose, MIT License, March 2014, San Marino


// P_2_2_1_01.pde
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
 * draw the path of a stupid agent
 *
 * MOUSE
 * position x          : drawing speed
 *
 * KEYS
 * BACKSPACE           : delete display
 * s                   : save png
 * r                   : start pdf recording
 * e                   : stop pdf recording
 */

import processing.pdf.*;
import java.util.Calendar;

boolean recordPDF = false;

//direzioni (numeri interi)
int NORTH = 0;
int NORTHEAST = 1; 
int EAST = 2;
int SOUTHEAST = 3;
int SOUTH = 4;
int SOUTHWEST = 5;
int WEST = 6;
int NORTHWEST= 7;

//grandezza gradini e diametro(numeri decimali)
float stepSize = 6;
float diameter = 10;

//direzione 
int direction;
//definizione posizioni x e y
float posX, posY;


void setup() {
  size(1000, 800);
  background(255);
  smooth();
  noStroke();
  //quantizzazione posizioni x e y
  posX = width/2;
  posY = height/2;
}

//disegnamo
void draw() {
  for (int i=0; i<=mouseX; i++) {
    direction = (int) random(0, 8);
    
//se la direzione è ...
    if (direction == NORTH) {  
      posY -= stepSize;  
    } 
    else if (direction == NORTHEAST) {
      posX += stepSize;
      posY -= stepSize;
    } 
    else if (direction == EAST) {
      posX += stepSize;
    } 
    else if (direction == SOUTHEAST) {
      posX += stepSize;
      posY += stepSize;
    }
    else if (direction == SOUTH) {
      posY += stepSize;
    }
    else if (direction == SOUTHWEST) {
      posX -= stepSize;
      posY += stepSize;
    }
    else if (direction == WEST) {
      posX -= stepSize;
    }
    else if (direction == NORTHWEST) {
      posX -= stepSize;
      posY -= stepSize;
    }

    if (posX > width) posX = 0;
    if (posX < 0) posX = width;
    if (posY < 0) posY = height;
    if (posY > height) posY = 0;
    
//riempimento
    fill(0, 40);
   //cerchi che si disegnano in base alla posizione x e y
   ellipse(posX+stepSize/2, posY+stepSize/2, diameter, diameter/10);
  }
}

//se premo delete o la barra spaziatrice cancello tutto
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(255);
  //se premo "s" o "S" salvo immagine .png
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");

  // ------ pdf export ------
  // press 'r' to start pdf recording and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, timestamp()+".pdf");
      println("recording started");
      recordPDF = true;
      background(255); 
      noStroke();
      posX = width/2;
      posY = height/2;
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(255); 
    }
  }  
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
