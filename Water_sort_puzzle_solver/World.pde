
//The World class contains everything we need to draw the game field.
public class World {
  
  String solution;
  Vial current_mousing_vial;
  Node current_node;
  
  public World() {
    
    current_node = new Node("", 0);
    current_mousing_vial = current_node.all_vials[0];
    solution = "";
    
  }
  
  public void drawWorld() {
    for (int i=0; i<vials; i++) {
      current_node.all_vials[i].drawVial();
      
      if (current_node.all_vials[i].mousingOver() > -1) {
        current_mousing_vial = current_node.all_vials[i];
      }
      
    }
    
    
  }
  
  public int mousingVial() {
    for (int i=0; i<vials; i++) {
      if (current_node.all_vials[i].mousingOver() >= 0) {
        return i;
      }
    }
    return -1;
  }
  
  public void change_level_size() {
    current_node = new Node("", 0);
  }
  
  public void solve() {
    
    ArrayList<Color> all_colors = new ArrayList<Color>();
    
    for(int i=0; i<vials; i++) {
      for(int j=0; j<4; j++) {
        
        Boolean found_match = false;
        for(int k=0; k<all_colors.size(); k++) {
          if(all_colors.get(k).col == current_node.all_vials[i].content[j]) {
            all_colors.get(k).increase_count();
            found_match = true;
            break;
          }
        }
        
        if(!found_match) {
          all_colors.add(new Color(current_node.all_vials[i].content[j]));
        }
        
        
      }
    }
    
    Boolean checksout = true;
    for(int i=0; i<all_colors.size(); i++) {
      if((all_colors.get(i).col == "empty" && all_colors.get(i).count != 8) || (all_colors.get(i).col != "empty" && all_colors.get(i).count != 4)) {
        println("you have " + all_colors.get(i).count + " " + all_colors.get(i).col);
        checksout = false;
      }
    }
    
    if(checksout) {
      long start_time = System.nanoTime();
      if(current_node.solve()) {
        solution = "Solved!";
        println(current_node.instructions);
      } else {
        solution = "Unsolvable";
      }
      long calculating_time = System.nanoTime() - start_time;
      println();
      println("Time spent calculating: " + calculating_time + " nanoseconds " + "(" + (calculating_time/1000000000) + ")" + " seconds");
    } else {
      println();
      println("incorrect number of colors detected, please verify");
      println();
    }
    
  }
  
}
