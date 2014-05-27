ArrayList mouseMoves = new ArrayList();
Size ellipseSize = new Size(50, 50);
int maxCount = 70;

void setup(){
  size(window.outerWidth, window.outerHeight);
}

void draw() {

  // draw a black background
  background(0);

  // render all previous mouse moves
  renderPreviousMouseMoves();

  // add a new mouse move
  Point mouseMove = new Point(mouseX, mouseY);
  mouseMoves.add(mouseMove);

  // remove old mouse moves
  maintainMaxArraySize();

  // draw new ellipse
  drawEllipse(mouseMove.x, mouseMove.y);
}

void renderPreviousMouseMoves() {
  for (int i = mouseMoves.size() - 1; i > 0; i--) {
    Point move = mouseMoves.get(i);
    fill(random(255), random(255), random(255), (i * 3));
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
