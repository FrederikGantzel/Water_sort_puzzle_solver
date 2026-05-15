

public class Node {
  
  Boolean solution_found;
  String instructions;
  Vial[] all_vials = new Vial[vials];
  int depth;
  
  public Node(String input_instructions, int d) {
    
    for (int i=0; i<vials; i++) {
      int x = 100+(i*100);
      int y = 100;
      if (i>6) {
        y = y+400;
        x = x-700;
      }
      
      all_vials[i] = new Vial(x, y);
    }
    
    instructions = input_instructions;
    solution_found = false;
    depth = d;
    
  }
  
  public void copy_colors(Node copy_node) {
    for(int i=0; i<vials; i++) {
      for(int j=0; j<4; j++) {
        all_vials[i].content[j] = copy_node.all_vials[i].content[j];
      }
    }
  }
  
  public Boolean solve() {
    
    solution_found = true;
    for(int i=0; i<vials; i++) {
       if(all_vials[i].content[0] != all_vials[i].content[1] ||
       all_vials[i].content[1] != all_vials[i].content[2] ||
       all_vials[i].content[2] != all_vials[i].content[3]) {
          
         solution_found = false;
          
       }
     }
     
     if(solution_found) {
       return true;
     }
    
    for(int i=0; i<vials; i++) {
        int content_start = 0;
        int content_size = 1;
        String content_color = all_vials[i].content[0];
           
        for(int j=1; j<4; j++) {
          if(content_color == "empty") {
            content_color = all_vials[i].content[j];
            content_start++;
          } else if(all_vials[i].content[j] == content_color) {
            content_size++;
          } else {
            break;
          }
        }
        
        if(content_size < 4 && content_start < 3) {
          for(int j=0; j<vials; j++) {
            if(all_vials[j].content[content_size -1] == "empty" && i != j) {
              
              String bottom_color = "empty";
              int bottom_extra_depth = 0;
              for(int k=content_size; k<4; k++) {
                if(all_vials[j].content[k] != "empty") {
                  bottom_color = all_vials[j].content[k];
                  break;
                }
                bottom_extra_depth++;
              }
              
              if((content_start + content_size < 4 && (bottom_color == "empty" || bottom_color == content_color)) ||
              (content_start + content_size == 4 && bottom_color == content_color)) {
                Node new_branch = new Node(instructions + "-> pour " + content_color + " from vial " + (i+1) + " into " + bottom_color + " in vial " + (j+1) + "\n", depth+1);
                new_branch.copy_colors(this);
                
                for(int k=0; k<content_size; k++) {
                  new_branch.all_vials[i].content[k+content_start] = "empty";
                  new_branch.all_vials[j].content[k+bottom_extra_depth] = content_color;
                }
                
                if(new_branch.solve()) {
                  copy_colors(new_branch);
                  solution_found = true;
                  instructions = new_branch.instructions;
                  return true;
                } else {
                  //total_branches++;
                  //println("branches visited: " + total_branches);
                  //println("depth: " + new_branch.depth);
                  //println(new_branch.instructions);
                  //println();
                  new_branch = null;
                }
              }
              
            }
          }
        }
      }
      
      return false;
  }
  
  public void test_colors() {
    
    if(vials == 14) {
      all_vials[0].content[0] = "purple";
      all_vials[0].content[1] = "purple";
      all_vials[0].content[2] = "light green";
      all_vials[0].content[3] = "lime";
      all_vials[1].content[0] = "gray";
      all_vials[1].content[1] = "red";
      all_vials[1].content[2] = "cyan";
      all_vials[1].content[3] = "yellow";
      all_vials[2].content[0] = "brown";
      all_vials[2].content[1] = "dark green";
      all_vials[2].content[2] = "purple";
      all_vials[2].content[3] = "brown";
      all_vials[3].content[0] = "purple";
      all_vials[3].content[1] = "lime";
      all_vials[3].content[2] = "blue";
      all_vials[3].content[3] = "gray";
      all_vials[4].content[0] = "cyan";
      all_vials[4].content[1] = "gray";
      all_vials[4].content[2] = "lime";
      all_vials[4].content[3] = "brown";
      all_vials[5].content[0] = "pink";
      all_vials[5].content[1] = "yellow";
      all_vials[5].content[2] = "red";
      all_vials[5].content[3] = "cyan";
      all_vials[6].content[0] = "dark green";
      all_vials[6].content[1] = "orange";
      all_vials[6].content[2] = "orange";
      all_vials[6].content[3] = "brown";
      all_vials[7].content[0] = "dark green";
      all_vials[7].content[1] = "orange";
      all_vials[7].content[2] = "pink";
      all_vials[7].content[3] = "red";
      all_vials[8].content[0] = "orange";
      all_vials[8].content[1] = "pink";
      all_vials[8].content[2] = "light green";
      all_vials[8].content[3] = "red";
      all_vials[9].content[0] = "yellow";
      all_vials[9].content[1] = "light green";
      all_vials[9].content[2] = "lime";
      all_vials[9].content[3] = "blue";
      all_vials[10].content[0] = "yellow";
      all_vials[10].content[1] = "pink";
      all_vials[10].content[2] = "dark green";
      all_vials[10].content[3] = "blue";
      all_vials[11].content[0] = "gray";
      all_vials[11].content[1] = "blue";
      all_vials[11].content[2] = "light green";
      all_vials[11].content[3] = "cyan";
      all_vials[12].content[0] = "empty";
      all_vials[12].content[1] = "empty";
      all_vials[12].content[2] = "empty";
      all_vials[12].content[3] = "empty";
      all_vials[13].content[0] = "empty";
      all_vials[13].content[1] = "empty";
      all_vials[13].content[2] = "empty";
      all_vials[13].content[3] = "empty"; 
    } else {
      all_vials[0].content[0] = "purple";
      all_vials[0].content[1] = "light green";
      all_vials[0].content[2] = "cyan";
      all_vials[0].content[3] = "purple";
      all_vials[1].content[0] = "lime";
      all_vials[1].content[1] = "blue";
      all_vials[1].content[2] = "light green";
      all_vials[1].content[3] = "cyan";
      all_vials[2].content[0] = "blue";
      all_vials[2].content[1] = "pink";
      all_vials[2].content[2] = "gray";
      all_vials[2].content[3] = "orange";
      all_vials[3].content[0] = "lime";
      all_vials[3].content[1] = "red";
      all_vials[3].content[2] = "red";
      all_vials[3].content[3] = "light green";
      all_vials[4].content[0] = "cyan";
      all_vials[4].content[1] = "gray";
      all_vials[4].content[2] = "blue";
      all_vials[4].content[3] = "light green";
      all_vials[5].content[0] = "lime";
      all_vials[5].content[1] = "gray";
      all_vials[5].content[2] = "purple";
      all_vials[5].content[3] = "gray";
      all_vials[6].content[0] = "purple";
      all_vials[6].content[1] = "orange";
      all_vials[6].content[2] = "pink";
      all_vials[6].content[3] = "lime";
      all_vials[7].content[0] = "blue";
      all_vials[7].content[1] = "pink";
      all_vials[7].content[2] = "orange";
      all_vials[7].content[3] = "red";
      all_vials[8].content[0] = "pink";
      all_vials[8].content[1] = "red";
      all_vials[8].content[2] = "cyan";
      all_vials[8].content[3] = "orange";
      all_vials[9].content[0] = "empty";
      all_vials[9].content[1] = "empty";
      all_vials[9].content[2] = "empty";
      all_vials[9].content[3] = "empty";
      all_vials[10].content[0] = "empty";
      all_vials[10].content[1] = "empty";
      all_vials[10].content[2] = "empty";
      all_vials[10].content[3] = "empty";
    }
    
    
    
    
    
  }
  
  
}
