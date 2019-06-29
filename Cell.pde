class Cell {
  int x, y;
  boolean wa[] = {true, true, true, true}, v = false;
  Cell(int i, int j) {
    x = i;
    y = j;
  }

  void show() {
    if (pcells.size() == 0) {
      noStroke();
      noFill();
      rect(x, y, w, w);
    } 
    else if (v) {
      noStroke();
      if (cur == this)
        fill(0, 255, 0);
      else
        fill(127, 2, 162);
      rect(x, y, w, w);
    }
    stroke(255);
    if (wa[0])
      line(x, y, x+w, y);
    if (wa[1])
      line(x+w, y, x+w, y+w);
    if (wa[2])
      line(x+w, y+w, x, y+w);
    if (wa[3])
      line(x, y+w, x, y);
  }

  Cell neighbour() {
    ArrayList<Cell> cells = new ArrayList<Cell>();
    int i = this.x/w, j = this.y/w;
    if (j-1 >= 0 && !cell[i][j-1].v)
      cells.add(cell[i][j-1]);
    if (i+1 < c && !cell[i+1][j].v)
      cells.add(cell[i+1][j]);
    if (j+1 < r && !cell[i][j+1].v)
      cells.add(cell[i][j+1]);
    if (i-1 >= 0 && !cell[i-1][j].v)
      cells.add(cell[i-1][j]);
    int n = floor(random(0, cells.size()));
    if (cells.size() == 0)
      return null;
    else
      return cells.get(n);
  }
}
