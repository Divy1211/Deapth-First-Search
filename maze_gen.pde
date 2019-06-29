int w = 20;
int c, r;
Cell cell[][], cur;
ArrayList<Cell> pcells = new ArrayList<Cell>();
void setup() {
  size(800, 800);
  background(0);
  c = width/w;
  r = height/w;
  int j = 0;
  cell = new Cell[c][r];
  while (j < r) {
    int i = 0;
    while (i < c) {
      cell[i][j] = new Cell(i*w, j*w);
      i++;
    }
    j++;
  }
  cur = cell[0][0];
}
void draw() {
  background(0);
  cur.v = true;
  int j = 0;
  while (j < r) {
    int i = 0;
    while (i < c) {
      cell[i][j].show();
      i++;
    }
    j++;
  }
  Cell next = cur.neighbour();
  if (next != null) {
    if (cur.x-next.x == w) {
      cur.wa[3] = false;
      next.wa[1] = false;
    } else if (cur.x-next.x == -w) {
      cur.wa[1] = false;
      next.wa[3] = false;
    } else if (cur.y-next.y == w) {
      cur.wa[0] = false;
      next.wa[2] = false;
    } else if (cur.y-next.y == -w) {
      cur.wa[2] = false;
      next.wa[0] = false;
    }
    pcells.add(cur);
    cur = next;
  }
  else if(pcells.size() >= 1) {
    cur = pcells.get(pcells.size()-1);
    pcells.remove(pcells.size()-1);
  }
}
