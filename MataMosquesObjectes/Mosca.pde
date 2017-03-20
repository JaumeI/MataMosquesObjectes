class Mosca {
  int posX, posY, velocitat;
  PImage imatge;
  boolean negra;
  Mosca(boolean n) {
    negra=n;
    if (negra) {
      imatge=loadImage("mosca.png");
    } else {
      imatge=loadImage("moscaVermella.png");
    }
    reposiciona();
    //velocitat = velocitatNegra=((int)random(4)+2);
  }

  void reposiciona() {
    posX = width;
    posY=(int)random(height-imatge.height);
    velocitat=((int)random(4)+4);
  }

  boolean clicada(int ratoliX, int ratoliY) {
    boolean c=false;
    if (ratoliX > posX && ratoliX < posX+imatge.width && ratoliY> posY && ratoliY < posY + posY+imatge.height) {
      c=true;
      reposiciona();
    }
   return c;
  }
  boolean socNegra() {
    return negra;
  }
  void dibuixaiMou() {
    image(imatge, posX, posY);
    posX-=velocitat;
  }
  int getPosX(){
    return posX;
  }
  boolean esquerra(){
    return (posX<(0-imatge.width));
  }
  
  void mousePressed(){
     println("clicat!"); 
  }
}