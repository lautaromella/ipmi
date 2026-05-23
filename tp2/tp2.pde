// variable de pantallas quiero usarla para los condicionales e ir cambiando pantallas
int pantalla1 = 0;

// variable de texto pantalla inicial
String texto = "PRESS TO START";

// esta variable la voy a usar para la funcion millis
int tiempo;

// variables de imagenes
PImage fondo;
PImage perrito;
PImage pato;
PImage fondo3;
PImage ganador;
PImage fin;

// variables que quiero usar para mover al pato en el eje x
int posX = 0;
int velX = 2;

// le pongo 500 para que arranque desde abajo y no se vea todavia
int textY = 500;
int textY2 = 500;
int textY3 = 500;
int textY4 = 500;

// cambio de letra en herramientas creando una
PFont arial;

color colorMira = color(0);
// el boton para resetear el programa va a tener estas variabels
int botonX = 320;
int botonY = 420;
int botonTam = 80;

void setup() {

  size(640, 480);

  // carga de imagenes
  fondo = loadImage("fondo.jpg.jpg");
  perrito = loadImage("pantalla2.jpg.jpg");
  pato = loadImage("pato.jpg");
  fondo3 = loadImage("fondo3.jpg.jpg");
  ganador = loadImage("ganador.jpg");
  fin = loadImage("fin.jpg");
  // carga de fuente
  arial = loadFont("Arial.vlw");

  textSize(32);

  // esto lo voy a usar para cambiar las pantallas por tiempo
  tiempo = millis();
}

void draw() {



  if (pantalla1 == 0) {

    image(fondo, 0, 0, 640, 480);


    // que titilen las letras tipo videojuego

    if (frameCount % 60 < 30) {

      fill(0);

      text(texto, 200, 300);
    }

    // con esto logro que cada 5 segundos cambie la pantalla


    if (millis() - tiempo > 5000) {

      pantalla1 = 1;

      tiempo = millis();
    }
  } else if (pantalla1 == 1) {

    image(perrito, 0, 0, 640, 480);

    fill(255);

    text("Nuestro perro huele algo... \n conecta tu ness y preparate para disparar", 50, textY);

    // con esto hago que el texto venga desde abajo

    if (textY > 150) {

      textY = textY - 2;
    }

    // siguiente pantalla mismo condicional que antes

    if (millis() - tiempo > 5000) {

      pantalla1 = 2;

      tiempo = millis();
    }
  } else if (pantalla1 == 2) {

    image(fondo3, 0, 0, 640, 480);

    // con esta logro que se mueva el pato


    posX = posX + velX;

    // si toca los bordes cambia direccion

    if (posX > width - 80 || posX < 0) {

      velX = -velX;
    }



    image(pato, posX, 250, 80, 80);

    fill(255);

    text("DISPARA AL PATO \n si erras un disparo perdes una vida", 130, textY2);


    if (textY2 > 200) {

      textY2 = textY2 - 2;
    }

    // cambio automatico de pantalla

    if (millis() - tiempo > 5000) {

      pantalla1 = 3;

      tiempo = millis();
    }
  } else if (pantalla1 == 3) {

    image(ganador, 0, 0, 640, 480);

    fill(255);

    text("GANASTE \n lograste capturar a los patos \n para nuestro perro cazador", 50, textY3);

    // texto que sube desde abajo

    if (textY3 > 180) {

      textY3 = textY3 - 2;
    }
    if (millis() - tiempo > 5000) {

      pantalla1 = 4;

      tiempo = millis();
    }
  } else if (pantalla1 == 4) {

    image(fin, 0, 0, 640, 480);


    // texto
    fill(255);

    textSize(28);

    text("EL JUEGO TERMINO \n\n lograste el maximo puntaje \n nuestro perro esta contento", 100, textY4);

    if (textY4 > 265) {

      textY4 = textY4 - 2;
    }
    fill(200, 0, 0);

    ellipse(botonX, botonY, botonTam, botonTam);

    fill(255);

textSize(16);

text("RESTART", botonX - 30, botonY + 5);
  }









  mira();
  colorMira = color(0);
}

void keyPressed() {

  // aca con espacio volvemos a la pantalla principal

  if (key == ' ') {

    pantalla1 = 0;

    //reinicio tiempo para que no salte pantallas
    tiempo = millis();

    //reinicio posiciones de texto

    textY = 500;
    textY2 = 500;
    textY3 = 500;
  }
}


//DISPARO
void mousePressed() {

  // esto lo hice solo for fun
  // cuando clickeas te aparecen las coordenadas como disparo
  colorMira = color(255, 0, 0);
  println("DISPARO EN: " + mouseX + ", " + mouseY);
  if (pantalla1 == 4) {


  if (mouseX > 280 && mouseX < 360 &&
    mouseY > 380 && mouseY < 460) {

  
    pantalla1 = 0;

    tiempo = millis();

    
    textY = 500;
    textY2 = 500;
    textY3 = 500;
    textY4 = 500;

   
    posX = 0;
  }
  }
}
  





  void mira() {

    // mira que sigue al mouse

    stroke(colorMira);

    strokeWeight(2);

    noFill();

    ellipse(mouseX, mouseY, 30, 30);

    line(mouseX - 20, mouseY, mouseX + 20, mouseY);

    line(mouseX, mouseY - 20, mouseX, mouseY + 20);
  }
