
//Initializing some static values here.
//We need one World object.
World world;
public int vials = 11;
public long total_branches = 0;

void setup() {
  size(1150, 850);
  world = new World();
}

//The draw() functuon is build in to Processing, and is used once every frame to draw everything on screen.
void draw() {
  background(225);
  stroke(0);
  strokeWeight(5);
  fill(225);
  
  if(mouseOver_start()) {
    fill(255);
  }
  rect(830, 320, 250, 120);
  
  if(mouseOver_size_button()) {
    fill(255);
  } else {
    fill(225);
  }
  
  rect(880, 150, 25, 25);
  
  fill(0);
  textSize(60);
  text("Start", 890, 395);
  textSize(25);
  text("14 vial level", 915, 170);
  if(vials == 14) {
    textSize(60);
    text("X", 878, 183);
  }
  
  world.drawWorld();
  
  if (world.solution == "Unsolvable") {
    fill(255, 50, 50);
  } else if (world.solution == "Solved!") {
    fill(50, 255, 50);
  }
  textSize(220);
  text(world.solution, 50, 450);
  
}

void mousePressed() {
  
  if(world.solution == "") {
    if(world.current_mousing_vial.mousingOver() > -1) {
      world.current_mousing_vial.changeColor(world.current_mousing_vial.mousingOver());
    }
    if(mouseOver_start()) {
      world.solve();
    }
  } else {
    world.solution = "";
  }
  if(mouseOver_size_button()) {
    if(vials == 11) {
      vials = 14;
    } else {
      vials = 11;
    }
    world.change_level_size();
  }
  
}

Boolean mouseOver_start() {
  if(mouseX > 830 && mouseX < 1085 && mouseY > 320 && mouseY < 440) {
    return true;
  } else {
    return false;
  }
}

Boolean mouseOver_size_button() {
  if(mouseX > 880 && mouseX < 905 && mouseY > 150 && mouseY < 175) {
    return true;
  } else {
    return false;
  }
}

void keyPressed() {
  if(key == 't' || key == 'T') {
    world.current_node.test_colors();
  }
}
