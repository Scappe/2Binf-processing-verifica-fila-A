class Personaggio {
  PShape shape;
  float x, y;

  Personaggio(String fileName, float x, float y) {
    shape = loadShape(fileName);
    this.x = x;
    this.y = y;
  }

  void setColor(color newColor) {
    shape.setFill(newColor);
  }

  void display() {
    shape(shape, x, y);
  }

  void laprossimavoltavoglioilfiledritto() {
    shape.rotateX(radians(180));
  }
}

class Flora_Fauna { // prof: il testo chiedeva di chiamarla "Trasmutabile"
  PShape shape;
  float x, y;

  Flora_Fauna(String fileName, float x, float y) {
    shape = loadShape(fileName);
    this.x = x;
    this.y = y;
  }
  void move() {
    if (x>width*20/100) { 
      this.x -= 5;
    }
  }
  void setColor(color newColore) {
    shape.setFill(newColore);
  }
  void display() {
    shape(shape, x, y);
  }
}


Personaggio strega;
Flora_Fauna foglia;
Flora_Fauna colibri;

float alpha=255;



void setup() {
  fullScreen(P3D);
  colibri= new Flora_Fauna("colibri.obj", width*9/10, height/2);
  strega = new Personaggio("witch.obj", width/10, height/2);
  strega.setColor(color(101, 67, 33));
  foglia= new Flora_Fauna("quill.obj", width*9/10, height/2);
  foglia.setColor(color(126, 124, 209, alpha));
  strega.laprossimavoltavoglioilfiledritto();
}

void draw() {
  background(#3a96a6);
  lights();
  strega.display();
  foglia.move();
  /*tecnicamente il colibrì appare lentamente perché prende tempo per caricare il file, quindi la richiesta 
   della trasformazione lenta è stata 'tecnicamente' assolta ma io aggiungo delay nel caso avessi una macchina potente*/
   // prof: no, così il colibrì appare istantaneamente, non rispetta il requisito
  if (keyPressed && key == ' ') {
    delay(200);
    colibri.display();
    //tecnicamente il valore sommato di alpha di colibri e foglia è sempre 255: 255+0=255, 0+255=0   :)
    // prof: il valore di alpha della foglia non varia, perché imposti il color solo nel setup, quindi la somma è 255+255
    alpha = 0;
  } else foglia.display();
  colibri.move();
}
