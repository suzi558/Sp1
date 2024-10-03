// Klasse til regndråber
class Raindrop {
    float x; 
    float y; 
    float speed; 

    Raindrop(float tempX, float tempY) {
        this.x = tempX;
        this.y = tempY; 
        this.speed = random(2, 5); // Tilfældig hastighed for hver dråbe
    }

    void fall() {
        y += speed; // Opdater Y-positionen
        if (y > height) { // Hvis dråben går ud af skærmen
            y = 0; // Start forfra øverst
            x = random(width); // Ny tilfældig X-position
        }
    }

    void display() {
        fill(0, 0, 255); // Farve for regndråber
        ellipse(x, y, 5, 10); // Tegn dråben
    }
}
