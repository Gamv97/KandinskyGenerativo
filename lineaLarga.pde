class lineaLarga {
  float cx = width;
  float cy = height;
  int radius = min(width, height) / 2;
  float  secondsRadius = radius * 0.72;
  
  void crear() {

      float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;

      stroke(0);
      strokeWeight(5);

      //line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
      line(cx, cy,( cx + cos(s) * secondsRadius)*-1, (cy + sin(s) * secondsRadius)*-1);
    }
  
}
