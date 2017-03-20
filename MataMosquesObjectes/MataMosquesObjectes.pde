PFont lletra;
Mosca moscaNegra, moscaVermella;
int posXNegra, posYNegra, posXVermella, posYVermella, velocitatNegra, velocitatVermella, punts;
void setup() {
  size(600, 600);
  lletra = createFont("Arial", 48);
  textFont(lletra);
  moscaNegra = new Mosca(true);
  moscaVermella = new Mosca(false);
  punts=0;
}

void draw() {
  background(0);
  text(punts, width/2, 50);
  moscaVermella.dibuixaiMou();
  moscaNegra.dibuixaiMou();
  comprovaLimits();
  comprovaFiJoc();

  delay(50);
}
void mousePressed()
{
  if (moscaNegra.clicada(mouseX, mouseY)) {
    punts++;
  } else if ( moscaVermella.clicada(mouseX, mouseY)) {
    gameOver(false);
  }
}

void comprovaLimits() {
  if (moscaNegra.esquerra()) {
    moscaNegra.reposiciona();
    punts--;
  }
  if (moscaVermella.esquerra()) {
    moscaVermella.reposiciona();
  }
}

void comprovaFiJoc() {
  if (punts<0) {
    gameOver(false);
  } else if (punts>10) {
    gameOver(true);
  }
}

void gameOver(boolean guanyat) {
  String s;
  background(0);
  if (guanyat) {
    s="Has guanyat!!!";
  } else {
    s= "Has perdut! Has fet " + punts + " punts!";
  }

  text(s, width/2 -(textWidth(s)/2), height/2);
  noLoop();
}