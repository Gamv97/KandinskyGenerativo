class Cuadricula {
  FloatList coordenadasCX = new FloatList();
  FloatList coordenadasCY = new FloatList();
  IntList timer = new IntList();
  IntList rotacion = new IntList();
  float[] fill = new float[]{255, random(0, 128), 255, random(0, 128), random(0, 128), 255, random(0, 128), 255, 255, random(0, 128), 225, random(0, 128), random(0, 128), 255, random(0, 128), 255};
  IntList tam = new IntList();

  FloatList bezierX = new FloatList();
  FloatList bezierY = new FloatList();

  float t=0;

  void crear(boolean crear, float posX, float posY) {
    if (crear==true) {
      coordenadasCX.append(posX);    
      coordenadasCY.append(posY);
      timer.append(second());
      rotacion.append(int(random(1, 6)));
      tam.append(int(random(10, 50)));
      for (int i=0; i<4; i++) {
        bezierX.append(random(width));
        bezierY.append(random(height));
      }
    }
  }


  void dibujar() {

    if ( coordenadasCX.size()>0) {
      for (int i = 0; i<coordenadasCX.size(); i++) {
        pushMatrix();
        translate(coordenadasCX.get(i), coordenadasCY.get(i));
        strokeWeight(0.2);     
        rotate(PI/rotacion.get(i));
        for (int j=0; j< 4; j++) {
          for (int k=0; k<4; k++) {
            fill(fill[(j+(k*4))], 128);
            println(i);
            rect(tam.get(i)*j*2, tam.get(i)*k, tam.get(i)*2, tam.get(i));
          }
        } 
        popMatrix();
      }
      mover();
    }
  }

  void mover() {
    for (int i = 0; i<coordenadasCX.size(); i++) {
      coordenadasCX.set(0, bezierPoint(bezierX.get((i*4)), bezierX.get((i*4)+1), bezierX.get((i*4)+2), bezierX.get((i*4)+3), t));
      coordenadasCY.set(0, bezierPoint(bezierY.get((i*4)), bezierY.get((i*4)+1), bezierY.get((i*4)+2), bezierY.get((i*4)+3), t));
      t +=0.003;
      if (dist(coordenadasCX.get(0), coordenadasCY.get(0), bezierX.get((i*4)+3), bezierY.get((i*4)+3))<1) {
        nuevosBezier(i);
        t=0;
      }
    }
  }

  void nuevosBezier(int indice) {
    bezierX.set(indice*4, bezierX.get((indice*4)+3));
    bezierY.set(indice*4, bezierY.get((indice*4)+3));
    for (int i=1; i< 4; i++) {
      bezierX.set((indice*4)+i, random(width));
      bezierY.set((indice*4)+i, random(height));
    }
  }

  void eliminar() {
    if ( coordenadasCX.size()>0) {
      for (int i=0; i< coordenadasCX.size(); i++) {
        if (second() == timer.get(i)+4) {
          coordenadasCX.remove(i);
          coordenadasCY.remove(i);
          timer.remove(i);
          rotacion.remove(i);
          tam.remove(i);
          for (int j=0; j<4; j++) {
            bezierX.remove(0);
            bezierY.remove(0);
          }
        }
        if (second()==0&&timer.get(i)==56||second()==1&&timer.get(i)==57||second()==2&&timer.get(i)==58||second()==3&&timer.get(i)==59) {
          coordenadasCX.remove(i);
          coordenadasCY.remove(i);
          timer.remove(i);
          rotacion.remove(i);
          tam.remove(i);
          for (int j=0; j<4; j++) {
            bezierX.remove(0);
            bezierY.remove(0);
          }
        }
      }
    }
  }
}
