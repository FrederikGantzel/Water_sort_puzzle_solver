

public class Vial {
  
  
  int xcord;
  int ycord;
  String[] content = new String[4];
  
  
  public Vial(int x, int y) {
    xcord = x;
    ycord = y;
    
    for (int i=0; i<4; i++) {
      content[i] = "empty";
    }
  }
  
  public void drawVial() {
    stroke(0);
    strokeWeight(4);
    line(xcord, ycord, xcord, ycord+202);
    line(xcord, ycord+202, xcord+52, ycord+202);
    line(xcord+52, ycord+202, xcord+52, ycord);
    
    for (int i=0; i<4; i++) {
      
      strokeWeight(2);
      if (content[i] == "empty") {
        fill(225);
      } else if (content[i] == "gray") {
        fill(120);
      } else if (content[i] == "purple") {
        fill(145, 5, 175);
      } else if (content[i] == "brown") {
        fill(125, 90, 40);
      } else if (content[i] == "cyan") {
        fill(5, 265, 255);
      } else if (content[i] == "pink") {
        fill(255, 5, 255);
      } else if (content[i] == "dark green") {
        fill(25, 100, 20);
      } else if (content[i] == "orange") {
        fill(255, 140, 5);
      } else if (content[i] == "yellow") {
        fill(255, 255, 5);
      } else if (content[i] == "light green") {
        fill(150, 255, 20);
      } else if (content[i] == "lime") {
        fill(20, 255, 150);
      } else if (content[i] == "blue") {
        fill(5, 5, 255);
      } else {
        fill(255, 5, 5);
      }
      
      rect(xcord+1, ycord+1+(i*50), 50, 50);
    }
  }
  
  public int mousingOver() {
    
    for (int i=0; i<4; i++) {
      if (mouseX > xcord+1 && mouseX < xcord+51
      && mouseY > ycord+1+(i*50) && mouseY < ycord+51+(i*50)) {
        return i;
      }
    }
    
    return -1;
  }
  
  public void changeColor(int x) {
    if (content[x] == "empty") {
        content[x] = "gray";
      } else if (content[x] == "gray") {
        content[x] = "purple";
      } else if (content[x] == "purple") {
        content[x] = "brown";
      } else if (content[x] == "brown") {
        content[x] = "cyan";
      } else if (content[x] == "cyan") {
        content[x] = "pink";
      } else if (content[x] == "pink") {
        content[x] = "dark green";
      } else if (content[x] == "dark green") {
        content[x] = "orange";
      } else if (content[x] == "orange") {
        content[x] = "yellow";
      } else if (content[x] == "yellow") {
        content[x] = "light green";
      } else if (content[x] == "light green") {
        content[x] = "lime";
      } else if (content[x] == "lime") {
        content[x] = "blue";
      } else if (content[x] == "blue") {
        content[x] = "red";
      } else {
        content[x] = "empty";
      }
  }
  
}
