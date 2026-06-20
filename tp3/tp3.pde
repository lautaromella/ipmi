// https://youtu.be/XEw7yVhIUbs
PImage imagen;

int tam = 50;
int filas = 8;
int columnas = 12;

boolean mover = false;
int modoColor = 0;
float angulo = 0;

void setup() {
  size(800, 400);
  imagen = loadImage("imagen.jpg");
  rectMode(CORNER);
}

void draw() {
  background(220);

  image(imagen, 0, 0, 400, 400);

  for (int fila = 0; fila < filas; fila++) {

    float corrimiento = correr(fila);

    println("Fila " + fila + ": " + corrimiento);

    if (mover) {
      if (fila % 2 == 0) {
        corrimiento += 15;
      } else {
        corrimiento -= 15;
      }
    }

    for (int col = 0; col < columnas; col++) {

      float x = 400 + corrimiento + col * tam;
      float y = fila * tam;

      float distancia = dist(mouseX, mouseY, x, y);

      float tamActual = tam;

      if (distancia < 120) {
        tamActual = map(distancia, 0, 120, tam * 2, tam);
      }

      if (distancia < 50) {
        y -= 30;
      } else if (distancia < 100) {
        y -= 20;
      } else if (distancia < 150) {
        y -= 10;
      }

      if ((fila + col) % 2 == 0) {
        dibujarCuadrado(x, y, tamActual, colorPrincipal());
      } else {
        dibujarCuadrado(x, y, tamActual, colorSecundario());
      }
    }
  }
}

void dibujarCuadrado(float x, float y, float lado, color c) {
  pushMatrix();

  translate(x + lado / 2, y + lado / 2);

  // solo rota si apretás G
  rotate(radians(angulo));

  fill(c);
  stroke(120);

  rect(-lado / 2, -lado / 2, lado, lado);

  popMatrix();
}

float correr(int fila) {
  if (fila % 2 == 0) {
    return 0;
  } else {
    return tam / 2;
  }
}

color colorPrincipal() {
  if (modoColor == 0) {
    return color(0);
  } else {
    return color(255);
  }
}

color colorSecundario() {
  if (modoColor == 0) {
    return color(255);
  } else {
    return color(0);
  }
}

void keyPressed() {

  if (key == 'c' || key == 'C') {
    if (modoColor == 0) {
      modoColor = 1;
    } else {
      modoColor = 0;
    }
    println("modoColor = " + modoColor);
  }

  if (key == 'm' || key == 'M') {
    mover = !mover;
  }

  if (key == 'g' || key == 'G') {
    angulo += 5;
  }

  if (key == 'r' || key == 'R') {
    mover = false;
    modoColor = 0;
    angulo = 0;
  }
}
