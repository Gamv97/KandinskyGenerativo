class tresLineas {
  FloatList colores = new FloatList(); 
  FloatList coordenadasX = new FloatList();
  FloatList coordenadasY = new FloatList();
  IntList timer = new IntList();


  void crear(boolean crear, float posX, float posY) {
    if (crear==true) {
      coordenadasX.append(posX);    
      coordenadasY.append(posY);
      timer.append(second());
    }
  }

  void dibujar() {
    if ( coordenadasX.size()>0) {
      for (int i = 0; i<coordenadasX.size(); i++) {
        beginShape();
        noStroke();
        fill(0);
        vertex(coordenadasX.get(i)-50, coordenadasY.get(i)-20);
        vertex(coordenadasX.get(i)+50, coordenadasY.get(i)+25);
        vertex(coordenadasX.get(i)+50, coordenadasY.get(i)+20);
        vertex(coordenadasX.get(i)-50, coordenadasY.get(i)-25);
        endShape();
        beginShape();
        noStroke();
        //fill(0, 128);
        vertex(coordenadasX.get(i)-50+10, coordenadasY.get(i)-20-10);
        vertex(coordenadasX.get(i)+50+10, coordenadasY.get(i)+25-10);
        vertex(coordenadasX.get(i)+50+10, coordenadasY.get(i)+20-10);
        vertex(coordenadasX.get(i)-50+10, coordenadasY.get(i)-25-10);
        endShape();
        beginShape();
        noStroke();
        //fill(0, 128);
        vertex(coordenadasX.get(i)-50+20, coordenadasY.get(i)-20-20);
        vertex(coordenadasX.get(i)+50+20, coordenadasY.get(i)+25-20);
        vertex(coordenadasX.get(i)+50+20, coordenadasY.get(i)+20-20);
        vertex(coordenadasX.get(i)-50+20, coordenadasY.get(i)-25-20);
        endShape();
      }
    }
  }
  void eliminar() {
      for (int i=0; i< coordenadasX.size(); i++) {
        coordenadasX.remove(i);
        coordenadasY.remove(i);
      }
  }
}
