int rows = 3;
int cols = 3;
int size = 200;

int turn = 0;
int turnsLeft = 9;

boolean gameFinished = false;

Cell[][] c = new Cell[cols][rows]; // O = 0 and X = 1 

void validate(String l)  {
  for (int i = 0; i < cols; i++)  {
    for (int j = 0; j < rows; j++)  {
      //horizontal
      if (i+2 < cols)  {
        if (c[i][j].label == l && c[i+1][j].label == l && c[i+2][j].label == l)  {
          gameFinished = true;
          
        }
      }
      //vertical
      if (j+2 < rows)  {
        if (c[i][j].label == l && c[i][j+1].label == l && c[i][j+2].label == l)  {
          gameFinished = true;
        }
      }
      // cross = \
      if (i+2 < cols && j+2 < rows)  {
        if (c[i][j].label == l && c[i+1][j+1].label == l && c[i+2][j+2].label == l)  {
          gameFinished = true;
        }
      }
      // cross = /
      if (i+2 < cols && j+2 < rows)  {
        if (c[i][j+2].label == l && c[i+1][j+1].label == l && c[i+2][j].label == l)  {
          gameFinished = true;
        }
      }
    }
  }
}

void keyPressed()  {
  if (key == 'r')  {
    for (int i = 0; i < cols; i++)  {
        for(int j = 0; j < rows; j++)  {
          println(c[i][j].label);
          c[i][j].label = "";
        }
      }
  }
}


void setup()  {
  size(600, 700);
  background(255);
  for (int i = 0; i < cols; i++)  {
    for (int j = 0; j < rows; j++)  {
      c[i][j] = new Cell(i * size, j * size, size);
    }
  }
  turn = floor(random(0 , 1));
}

void draw()  {
  validate("X");
  validate("O");
  if (gameFinished)  {
    textSize(30);
    if (turn == 0)  {
      text("O WON!!", 50, 650);
    }else if (turn == 1) {
      text("X WON!!", 50, 650);
    }else if (turnsLeft <= 0)  {
      text("Its a draw!!", 50, 650);
    }
    textSize(100);

  }
  
  for (int i = 0; i < cols; i++)   {
    for (int j = 0; j < rows; j++)  {
      if (mousePressed && c[i][j].contains(mouseX, mouseY) && c[i][j].occupied == false && gameFinished == false)  {
        if (turn == 0)  {
          c[i][j].label = "X";
          turn = 1;
        }else{
          c[i][j].label = "O";
          turn = 0;
        }
        c[i][j].occupied = true;
        turnsLeft -= 1;
      }
      c[i][j].drawCell();
    }
  }
}
