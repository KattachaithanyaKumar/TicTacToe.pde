class Cell  {
  int x, y;
  int size;
  String label = "";
  boolean occupied = false;
  
  Cell(int xx, int yy, int ss)  {
    this.x = xx;
    this.y = yy;
    this.size = ss;
  }
  
  void drawCell()  {
    fill(0);
    text(label, x + 75, y + 125);
    textSize(100);
    noFill();
    stroke(64);
    rect(x, y, size, size);
  }
  
  boolean contains(int xx, int yy)   {
    if (xx > this.x && xx < this.x + size && yy > this.y && yy < this.y + size)  {
      return true;
    }else{
      return false;
    }
  }
}
