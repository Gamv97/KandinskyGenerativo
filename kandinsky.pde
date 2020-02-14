import com.hamoid.*;

//Color
color c;

VideoExport videoExport;
////Detección de personas
import gab.opencv.*;
import processing.video.*;
import java.awt.*;
Capture video;
OpenCV opencv;
///////////Cuadrilateros///////////////
Cuadrilateros c1;
boolean crear = false;
int contadorCuadrilateros = 0;
//////////Cuadricula//////////////////
Cuadricula cua1;
int contadorCuadricula =0;
//////////Circulos////////////////////
Circulo cir1;
color cCirculo;
int contadorCirculo =0;
//////////tresLineas//////////////////
tresLineas t1;
int contadorTresLineas=0;
//////////lineaLarga/////////////////
lineaLarga ll;
///////////imagen1//////////
imagen1 img1;

void setup() {
  //videoExport = new VideoExport(this);
  //videoExport.startMovie();

  ////////////Detección
  //video = new Capture(this, 640/2, 480/2);
  video = new Capture(this, 640/2, 480/2, "HD Pro Webcam C920");
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade("haarcascade_frontalface_alt.xml");  

  video.start();
  ///////////////////////////7


  fullScreen();
  //size(400, 400);
  c1 = new Cuadrilateros();
  cua1 = new Cuadricula();
  cir1 = new Circulo();
  t1= new tresLineas();
  ll= new  lineaLarga();
  img1= new imagen1();
  
  noCursor();

}

void draw() {
  background(255);
  fill(0);
  

  //image(video, 0, 0);
  //////////////////Detección
  opencv.loadImage(video);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  //////Cuadrilateros/////
  c1.dibujar();
  c1.eliminar();
  //////Cuadricula///////
  cua1.dibujar();
  cua1.eliminar();
  //////Circulo///////
  cir1.dibujar();
  //////tresLineas////
  t1.dibujar();
  
  if (faces.length== 0) {
    t1.eliminar();
  }

  if (faces.length!=0) {

    for (int i = 0; i < faces.length; i++) {
      if (faces.length!= 0) crear = true;
      else crear = false;

         ///////////////lineaLarga
      ll.crear();
      
      ////////////////imagen1
      img1.crear();

      /////Cuadrilateros
      if (contadorCuadrilateros==0) {
        c = video.get(faces[i].x+int(random(200)), faces[i].y+int(random(200)));
        c1.crear(crear, map(faces[i].x, 0, 320, width, 0), map(faces[i].y, 0, 240, height, 0), c);
        contadorCuadrilateros=1;
      } else {
        contadorCuadrilateros=0;
      }
      /////Cuadricula
      if (second()%2==0) {
        if (contadorCuadricula==0) {
          cua1.crear(crear, map(faces[i].x, 0, 320, width, 0), map(faces[i].y, 0, 240, 0, height));
          contadorCuadricula=1;
        }
      } else {
        contadorCuadricula=0;
      }
      /////////Circulo

      if (contadorCirculo==0) {
        cCirculo = video.get(faces[i].x+int(random(200)), faces[i].y+int(random(200)));
        cir1.crear(crear, cCirculo, map(faces[i].x, 0, 320, 0, width), map(faces[i].y, 0, 240, height, 0));
        //contadorCirculo=1;
      }

      //////////////tresLineas
      if (second()%2==0) {
        if (contadorTresLineas==0) {
          t1.crear(crear, map(faces[i].x, 0, 320, 0, width), map(faces[i].y, 0, 240, height, 0));
          contadorTresLineas=1;
        }
      } else {
        contadorTresLineas=0;
      }

   
    } 


    /////////////////

    noFill();
    stroke(0, 255, 0);
    strokeWeight(3);
    println(faces.length);

    for (int i = 0; i < faces.length; i++) {
      println(faces[i].x + "," + faces[i].y);
      //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
    //videoExport.saveFrame();
  }
}

void captureEvent(Capture c) {
  c.read();
}

/*void keyPressed() {
 if (key == 'q') {
 videoExport.endMovie();
 exit();
 }
 }*/
