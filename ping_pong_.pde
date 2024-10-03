import java.util.ArrayList; // Import ArrayList

float p1y = 250; // Start position af spillerens bat
float bsx = 300; // Boldens startposition X
float bsy = 10; // Boldens startposition Y
float boldframeX; // Boldens hastighed ved X
float boldframeY = 4; // Boldens hastighed Y
int score = 0; // Spillerens start score er 0
boolean gamestart = false; // Spillet er ikke startet
ArrayList<Raindrop> raindrops; // ArrayList til regndråber



void setup() {
    noStroke(); // uden kantlinjer
    size(800, 650); // størrelsen på vinduet
    background(0); // Baggrund er sort
    resetBall(); // nulstiler bolden
    raindrops = new ArrayList<>(); // Opretter ArrayList til regndråber

    // Opretter nogle regndråber
    for (int i = 0; i < 50; i++) { // 100 regndråber
        raindrops.add(new Raindrop(random(width), random(height))); // Tilføj en ny dråbe med tilfældig position
    }
}




void draw() {
    background(#7D9CF7); // Blå baggrund
    drawRain(); // Tegn regn
    fill(255); 
    textSize(20); // Tekststørrelse 
    textAlign(CENTER); // Centerer "score" i midten 
    text("Score: " + score, width / 2, 30); // Viser ordet "Score" 

    if (bsx <= 0) { // Hvis bolden er mindre end eller lig med 0
        score++; 
        resetBall(); // Nulstil bolden 
    }

    if (bsx >= width) { // Hvis boldens startposition X er større eller lig med width
        boldframeX = -boldframeX; // Vend boldens retning
    }

    if (bsy < 0) { // Hvis boldens startposition Y er mindre end 0
        boldframeY = 5; // Bolden rammer toppen
    }

    if (bsy > height) { // Hvis boldens startposition Y er større end højden
        boldframeY = -5; // Bolden rammer bunden
    }

    if (bsy >= p1y && bsy <= p1y + 100 && bsx < 40) { // Hvis bolden rammer bat
        boldframeX = 5; // Bolden rammer bat
        bsy = p1y - 10; // Placer bolden over bat
    }
    
    

    // Bat størrelse og farve
    fill(#F77DE3); 
    rect(20, p1y, 25, 150); 


    // Bold størrelse og farve
    float r = random(255);
    float g = random(255); 
    float b = random(255); 
    fill(r, g, b);
    ellipse(bsx, bsy, 30, 30); 

    bsx += boldframeX; // Opdaterer boldens X-position 
    bsy += boldframeY; // Y-position 

    if (!gamestart) { // Dette bliver vist i starten 
        displayMessage("Tryk på mellemrum for at starte"); 
    }
}



void drawRain() {
    for (Raindrop drop : raindrops) { // Tegn hver dråbe
        drop.fall(); // Opdater positionen
        drop.display(); // Vis dråben
    }
}



void keyPressed() { 
    if (key == ' ') { // Tryk mellemrum for at starte 
        gamestart = true; // Spillet starter 
    }
    
    if (key == 's') {
        p1y -= 50; // Flyt bat op 
    }
    
    if (key == 'r') { 
        p1y += 50; // Flyt bat ned 
    }
}



void resetBall() {
    bsx = 400; // Nulstil boldens X-position 
    bsy = 10; // Nulstil boldens Y-position 
    boldframeX = random(3, 6); // Juster boldens X-hastighed
}



void displayMessage(String msg) {
    fill(255); 
    textAlign(CENTER); 
    textSize(32); 
    text(msg, width / 2, height / 2); 
}
