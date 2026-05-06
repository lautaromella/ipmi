PImage louvre; // variable imagen

void setup() {
  size(800, 400);
  louvre = loadImage("louvre.jpg");
}

void draw() {
  background(255);

  
  image(louvre, 0, 0, 400, 400);

  
  stroke(0);
  line(400, 0, 400, 400); // Línea divisoria

  
  pushMatrix(); // guarda el sistema de coordenadas actual
  translate(400, 0); // mueve el origen a la mitad derecha

  noStroke(); // desactiva bordes

 
  fill(135, 206, 235);
  rect(0, 0, 400, 200);  // Cielo

  
  fill(180, 180, 180);
  rect(0, 200, 400, 200); // Suelo

 
  fill(220, 180, 120);
  rect(50, 140, 300, 120);  // Edificio

 
  fill(200, 160, 100);
  rect(160, 100, 80, 40);  // Techo
fill(100, 200, 255, 100); // color celeste con transparencia
triangle(100, 120, 20, 300, 260, 300); // triangulo grande

stroke(0);  // vuelve a activar líneas negras
line(100, 120, 170, 300); // línea interna
line(100, 120, 260, 300); // lado derecho
line(100, 120, 20, 300); // lado izquierdo

line(70, 260, 230, 260); // base trasera

line(20, 300, 70, 260); // conexiones
line(260, 300, 230, 260);
  
triangle(340, 220, 280, 300, 400, 300); // triangulo chico

stroke(0); // líneas negras
line(340, 220, 340, 300); //línea central
line(340, 220, 400, 300); // lado derecho
line(340, 220, 280, 300); // lado izq

line(310, 270, 370, 270); // base atras 

line(280, 300, 310, 270); // conexion lineas
line(400, 300, 370, 270);

  popMatrix(); // vuelve al sistema normalS
  
   //
  fill( 0 );
  textSize( 24 );
  text( mouseX + " / " + mouseY, mouseX, mouseY );
  //
  println( mouseX + " / " + mouseY );
  println( frameRate );  //devuelve fps actual
  println( frameCount );  //cuenta la cantidad de frames desde que inicio el programa
  println("Louvre museum-");
  
}
