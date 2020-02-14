class Cuadrilateros {
  ////////Coordenadas, crear y borrar/////
  FloatList colores = new FloatList(); 
  FloatList coordenadasX = new FloatList();
  FloatList coordenadasY = new FloatList();
  FloatList timer = new FloatList(); 
  int contadorBorrar = 2;
  ////////Cuadrilateros///////////////////
  int tam = 200;
  FloatList verticesX = new FloatList();
  FloatList verticesY = new FloatList();
  FloatList nuevosVerticesX = new FloatList();
  FloatList nuevosVerticesY = new FloatList();
  float velocidad = 0.007;
  FloatList DistanciaX = new FloatList();
  FloatList DistanciaY = new FloatList();


  void crear(boolean crear, float posX, float posY, color col) {
    if (crear== true) {
      coordenadasX.append(posX);
      coordenadasY.append(posY);
      timer.append(second());
      //Agregar canales de color
      colores.append(red(col));
      colores.append(green(col));
      colores.append(blue(col));

      //crearVertices
      for (int j=0; j< 4; j++) {
        verticesX.append(posX + random(tam*-1, tam));
        verticesY.append(posY + random(tam*-1, tam));
      }
    }
  }

  void dibujar() {
    for (int i = 0; i<coordenadasX.size(); i++) {
      beginShape();
      noStroke();
      fill(colores.get(i*3), colores.get((i*3)+1), colores.get((i*3)+2), 128);
      //MUY BUEN COLOR
      //fill(124, 25, 136, 128);
      for (int j = 0; j< 4; j++) {
        vertex(verticesX.get(i+j), verticesY.get(i+j));
      }
      endShape();
    }
    movimiento1();
  }

  void eliminar() {
    for (int i=0; i< coordenadasX.size(); i++) {
      if (second() == timer.get(i)+4) {
        coordenadasX.remove(i);
        coordenadasY.remove(i);
        timer.remove(i);
        for (int k= 0; k<3; k++) {
          colores.remove(0);
        }

        //Vertices
        for (int j = 0; j<4; j++) {
          verticesX.remove(0);
          verticesY.remove(0);
        }
      }
      if (second()==0&&timer.get(i)==56||second()==1&&timer.get(i)==57||second()==2&&timer.get(i)==58||second()==3&&timer.get(i)==59) {
        coordenadasX.remove(0);
        coordenadasY.remove(0);
        timer.remove(i);
        for (int k= 0; k<3; k++) {
          colores.remove(0);
        }
        //Vertices
        for (int j = 0; j<4; j++) {
          verticesX.remove(0);
          verticesY.remove(0);
        }
      }
    }
  }

  void movimiento1() {
    //Inestabilidad
    for (int i= 0; i<coordenadasX.size(); i++) {
      for (int j= 0; j<4; j++) {
        verticesX.set(i+j, verticesX.get(i+j)+random(-0.6, .6));
        verticesY.set(i+j, verticesY.get(i+j)+random(-0.6, .6));
      }
    }
  }
}
