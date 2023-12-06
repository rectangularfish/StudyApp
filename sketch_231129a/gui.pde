/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:918574:
  appc.background(230);
} //_CODE_:window1:918574:

public void lofiButtonPressed(GButton source, GEvent event) { //_CODE_:lofiMusic:351987:
  playMusic(fileLofi);
} //_CODE_:lofiMusic:351987:

public void pianoButtonPressed(GButton source, GEvent event) { //_CODE_:pianoMusic:529890:

  playMusic(fileClassical);
} //_CODE_:pianoMusic:529890:

public void jazzButtonPressed(GButton source, GEvent event) { //_CODE_:jazzMusic:741816:
  playMusic(fileJazz);
} //_CODE_:jazzMusic:741816:

public void volumeSliderPressed(GSlider source, GEvent event) { //_CODE_:volumeSlider:449108:
  volume = volumeSlider.getValueF() / 100;
  currentMusic.amp(volume);
} //_CODE_:volumeSlider:449108:

public void playMusicButtonPressed(GButton source, GEvent event) { //_CODE_:pauseMusicB:501192:
  if (musicPlaying) {
    // Pause the music and store the current position
    currentMusic.pause();
    pausedTime = currentMusic.position();
    pauseMusicB.setText("Resume");
    musicPlaying = false;
  } else {
    // Resume the music from the stored position
    currentMusic.cue(pausedTime);
    currentMusic.play();
    pauseMusicB.setText("Pause");
    musicPlaying = true;
  }
} //_CODE_:pauseMusicB:501192:

public void setStudyTimer(GTextField source, GEvent event) { //_CODE_:studyAmount:773092:

  timer.timerStart = false;

  startTimer.setText("Start Timer");


  String studyAmountText = source.getText();
  if (!studyAmountText.isEmpty()) {
    int studyAmountValue = int(studyAmountText);
    studyTime = studyAmountValue;
    if (studyTime == 0 || studyTime > 999) {
      studyTime = 25;
    }
    println("Study time set to: " + studyTime);
  }
  timerChanged = true;
} //_CODE_:studyAmount:773092:

public void setBreakTimer(GTextField source, GEvent event) { //_CODE_:breakAmount:879775:
  timer.timerStart = false;
  startTimer.setText("Start Timer");

  String breakAmountText = source.getText();
  if (!breakAmountText.isEmpty()) {
    int breakAmountValue = int(breakAmountText);
    breakTime = breakAmountValue;
    if (breakTime == 0 || breakTime > 999) {
      breakTime = 5;
    }
    println("Break time set to: " + breakTime);
  }
  timerChanged = true;
} //_CODE_:breakAmount:879775:

public void timerPressed(GButton source, GEvent event) { //_CODE_:startTimer:907608:
  if (timer.timerStart == false) {
    startTimer.setText("Pause");
    timer.timerStart = true;
  } else if (timer.timerStart == true) {

    startTimer.setText("Resume");

    timer.timerStart = false;
  }
} //_CODE_:startTimer:907608:

public void addtoToDoList(GTextField source, GEvent event) { //_CODE_:addField:302669:
  if (event == GEvent.ENTERED) {
    // Get the text from the todoField
    String todoText = source.getText();

    // Check if the text is not empty
    if (!todoText.isEmpty()) {

      list.addTask(todoText);

      source.setText("");

      println("Task added to the Todo list: " + todoText);
    }
  }
} //_CODE_:addField:302669:

public void removetoToDoList(GTextField source, GEvent event) { //_CODE_:removeField:287909:
  if (event == GEvent.ENTERED) {
    // Get the text from the removeField
    String taskToRemove = source.getText();

    // Check if the text is not empty
    if (!taskToRemove.isEmpty()) {
      // Remove the task from the todo list
      list.tasks.remove(taskToRemove);


      source.setText("");


      // Print a message to the console (you can remove this line if not needed)
      println("Task removed from the Todo list: " + taskToRemove);
    } else {
      // Print a message to the console if the text field is empty (you can remove this line if not needed)
      println("Text field is empty. Please enter a task to remove.");
    }
  }
} //_CODE_:removeField:287909:

public void genFlashcardPressed(GButton source, GEvent event) { //_CODE_:genFlashcard:367377:
  fl = new Flashcard();

  createFlashcard = true;
} //_CODE_:genFlashcard:367377:

public void practice(GButton source, GEvent event) { //_CODE_:practiceFlashcard:245375:

    if(practiceFlashcards == false && flashcards.size() > 0) {
     
      
      practiceFlashcard.setText("Practice Flashcards");
      
      practiceFlashcards = true;  
      
    }else if(practiceFlashcards == true && flashcards.size() > 0) {
     
      
      practiceFlashcard.setText("Stop Practicing");
      
      practiceFlashcards = false;  
      
    }

} //_CODE_:practiceFlashcard:245375:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 590, 500, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  lofiMusic = new GButton(window1, 151, 76, 118, 30);
  lofiMusic.setText("Play Lofi Music");
  lofiMusic.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  lofiMusic.addEventHandler(this, "lofiButtonPressed");
  pianoMusic = new GButton(window1, 11, 75, 117, 30);
  pianoMusic.setText("Play Piano Music");
  pianoMusic.addEventHandler(this, "pianoButtonPressed");
  jazzMusic = new GButton(window1, 13, 161, 117, 30);
  jazzMusic.setText("Play Jazz Music");
  jazzMusic.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  jazzMusic.addEventHandler(this, "jazzButtonPressed");
  volumeSlider = new GSlider(window1, 79, 95, 124, 75, 10.0);
  volumeSlider.setShowValue(true);
  volumeSlider.setLimits(50, 0, 100);
  volumeSlider.setShowTicks(true);
  volumeSlider.setNumberFormat(G4P.INTEGER, 0);
  volumeSlider.setOpaque(false);
  volumeSlider.addEventHandler(this, "volumeSliderPressed");
  pauseMusicB = new GButton(window1, 157, 160, 115, 30);
  pauseMusicB.setText("No Music Playing");
  pauseMusicB.addEventHandler(this, "playMusicButtonPressed");
  musicLabel = new GLabel(window1, 89, 36, 85, 36);
  musicLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  musicLabel.setText("Music");
  musicLabel.setOpaque(false);
  label1 = new GLabel(window1, 376, 35, 126, 37);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Pomodoro Timer");
  label1.setOpaque(false);
  studyAmount = new GTextField(window1, 448, 77, 49, 30, G4P.SCROLLBARS_NONE);
  studyAmount.setText("25");
  studyAmount.setPromptText("25");
  studyAmount.setOpaque(true);
  studyAmount.addEventHandler(this, "setStudyTimer");
  studyLabel = new GLabel(window1, 353, 82, 80, 20);
  studyLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  studyLabel.setText("Study Time:");
  studyLabel.setOpaque(false);
  breakLabel = new GLabel(window1, 353, 125, 80, 20);
  breakLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  breakLabel.setText("Break Time:");
  breakLabel.setOpaque(false);
  breakAmount = new GTextField(window1, 449, 121, 50, 30, G4P.SCROLLBARS_NONE);
  breakAmount.setText("5");
  breakAmount.setPromptText("5");
  breakAmount.setOpaque(true);
  breakAmount.addEventHandler(this, "setBreakTimer");
  startTimer = new GButton(window1, 396, 164, 80, 30);
  startTimer.setText("Start Timer");
  startTimer.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  startTimer.addEventHandler(this, "timerPressed");
  todoLabel = new GLabel(window1, 80, 225, 105, 42);
  todoLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  todoLabel.setText("Todo List");
  todoLabel.setOpaque(false);
  addLabel = new GLabel(window1, 13, 281, 99, 32);
  addLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  addLabel.setText("Add:");
  addLabel.setOpaque(false);
  addField = new GTextField(window1, 128, 284, 120, 30, G4P.SCROLLBARS_NONE);
  addField.setPromptText("Add Something");
  addField.setOpaque(true);
  addField.addEventHandler(this, "addtoToDoList");
  removeLabel = new GLabel(window1, 13, 325, 101, 31);
  removeLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  removeLabel.setText("Remove:");
  removeLabel.setOpaque(false);
  removeField = new GTextField(window1, 127, 328, 120, 30, G4P.SCROLLBARS_NONE);
  removeField.setPromptText("Remove Something");
  removeField.setOpaque(true);
  removeField.addEventHandler(this, "removetoToDoList");
  label2 = new GLabel(window1, 396, 228, 100, 38);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Flashcards");
  label2.setOpaque(false);
  genFlashcard = new GButton(window1, 386, 282, 116, 30);
  genFlashcard.setText("Create a flashcard");
  genFlashcard.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  genFlashcard.addEventHandler(this, "genFlashcardPressed");
  practiceFlashcard = new GButton(window1, 382, 328, 129, 30);
  practiceFlashcard.setText("Practice Flashcards");
  practiceFlashcard.addEventHandler(this, "practice");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton lofiMusic; 
GButton pianoMusic; 
GButton jazzMusic; 
GSlider volumeSlider; 
GButton pauseMusicB; 
GLabel musicLabel; 
GLabel label1; 
GTextField studyAmount; 
GLabel studyLabel; 
GLabel breakLabel; 
GTextField breakAmount; 
GButton startTimer; 
GLabel todoLabel; 
GLabel addLabel; 
GTextField addField; 
GLabel removeLabel; 
GTextField removeField; 
GLabel label2; 
GButton genFlashcard; 
GButton practiceFlashcard; 
