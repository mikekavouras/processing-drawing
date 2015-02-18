ArrayList mouseMoves = new ArrayList();
Size ellipseSize = new Size(50, 50);
boolean started = false;
int maxCount = 70;

void setup(){
  size(window.outerWidth, window.outerHeight);
}

void draw() {
  background(0);
  if (!started) return;
  renderPreviousMouseMoves();
  Point mouseMove = new Point(mouseX, mouseY);
  mouseMoves.add(mouseMove);
  maintainMaxArraySize();
}

void renderPreviousMouseMoves() {
  for (int i = mouseMoves.size() - 1; i > 0; i--) {
    Point move = mouseMoves.get(i);
    fill(255, 255, 255, (i * 3));
    stroke("#fff");
    drawEllipse(move.x, move.y, i, i);
  }
}

void maintainMaxArraySize() {
  if (mouseMoves.size() > maxCount) {
    mouseMoves.remove(mouseMoves.get(0));
  };
}

void drawEllipse(x, y, width, height) {
  ellipse(x, y, width || ellipseSize.width, height || ellipseSize.height);
};

document.addEventListener('mousemove', function() { started = true; }, false);
