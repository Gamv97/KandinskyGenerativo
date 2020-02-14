class Circulo {
  FloatList coordenadasX = new FloatList();
  FloatList coordenadasY = new FloatList();
  FloatList direccionX = new FloatList();
  FloatList direccionY = new FloatList();
  FloatList colores = new FloatList();

  void crear(boolean crear, color col, float  posX, float posY) {
    if (crear==true) {

      coordenadasX.append(posX);
      coordenadasY.append(posY);
      if (second()%2==0) direccionX.append(1 *random(12));
      else direccionX.append(-1*random(12));
      if (second()%2==0) direccionY.append(-1 *random(12));
      else direccionY.append(1*random(12));
      colores.append(red(col));
      colores.append(green(col));
      colores.append(blue(col));
    }
  }

  void dibujar() {
    for (int i= 0; i<coordenadasX.size(); i++) {
      noStroke();
      fill(colores.get(i*3), colores.get((i*3)+1), colores.get((i*3)+2));
      ellipse(coordenadasX.get(i), coordenadasY.get(i), 20, 20);
    }
    mover();
  }

  void mover() {
    for (int i= 0; i<coordenadasX.size(); i++) {
      coordenadasX.set(i, coordenadasX.get(i)+direccionX.get(i));
      coordenadasY.set(i, coordenadasY.get(i)+direccionY.get(i));
    }
  }

  void eliminar() {
    for (int i= 0; i<coordenadasX.size(); i++) {
      if(coordenadasX.get(i)>width||coordenadasX.get(i)<0||coordenadasY.get(i)>height||coordenadasY.get(i)<0){
        coordenadasX.remove(i);
        coordenadasY.remove(i);
        direccionX.remove(i);
        direccionY.remove(i);
        for(int j=0; j<3;j++){
          colores.remove((i*3)+j);
        }
      }
    }
  }
}
