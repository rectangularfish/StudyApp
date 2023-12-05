class TodoList {


  ArrayList<String> tasks;



  TodoList() {

    this.tasks = new ArrayList<String>();
  }



  void addTask(String task) {


    this.tasks.add(task);
  }

  void removeTask(String task) {
    // Check if the task exists before removing
    if (this.tasks.contains(task)) {
      this.tasks.remove(task);
      println("Task removed: " + task);
    } else {
      println("Task not found: " + task);
    }
  }


  void displayTasks() {
    textAlign(LEFT);
    textSize(64);
    fill(accent2);

    text(name + " " + "Todo list:", 10, height/2 - 150);
    textSize(48);
    // Display tasks
    for (int i = 0; i < tasks.size(); i++) {
      text("-" + " " + this.tasks.get(i), 30, (height/2 - 75) + (i * 50));
    }
  }
}