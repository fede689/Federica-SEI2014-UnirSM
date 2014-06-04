// Drawing tool for school project
// © Federica Capotosti for the course SEI2014 @ UnirSM  
// Didactic purpose, MIT License, March 2014, San Marino


//variables
float angle = 0.0;
 
void setup(){ 
    size(500, 500); //window size
    background(255); //white background color 
    smooth();
     
}
 
void draw(){
 
    if (mousePressed){ //when the mouse button is pressed 
 
        translate(mouseX, mouseY); //mouse position 
        rotate(angle); //rotation from the angle
        rect(-15, -15, random(10, 40), random(10, 40)); //what is drawing
        angle += 0.1;
         
    }
    
 

    // Determine the color quadrant according to the position
    if (mouseX < 250 && mouseY < 250){
        fill(random(0, 255), random(0, 255), random(0, 255),random(0, 255));
    }
 
    else if (mouseX > 250 && mouseY < 250) {
        fill(0, 15, 255); 
    }
 
    else if (mouseX < 250 && mouseY > 250) {
        fill(255, 20, 0); 
    }
 
    else if (mouseX > 250 && mouseY > 250){
        fill(55, 200, 150);
    }
        }

