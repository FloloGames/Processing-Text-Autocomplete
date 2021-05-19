class TextField extends MouseFunctions {
  WordSuggestion wordSuggestion;

  PVector pos, size;

  String userInput;
  boolean userIsTyping;
  color strokeColor;

  TextField(float x, float y, float sx, float sy) {
    float sizeX = width/2;
    float sizeY = 30;
    wordSuggestion = new WordSuggestion(width/2-sizeX/2, sizeY/2, sizeX, sizeY);
    pos = new PVector(x, y);
    size = new PVector(sx, sy);
    strokeColor = color(255);

    userInput = "";
  }
  void show() {
    noFill();
    stroke(strokeColor);
    strokeWeight(2);
    rect(pos.x, pos.y, size.x, size.y);
    fill(255);
    textSize(20);
    text(userInput, pos.x, pos.y, size.x, size.y);
    wordSuggestion.show();
  }
  void updateStrokeColor() {
    if (userIsTyping) {
      strokeColor = color(255, 0, 0);
    } else {
      strokeColor = color(255);
    }
  }
  void updateUserSearch() {
    String[] allUserWords = userInput.split(" ");
    String word = allUserWords[allUserWords.length-1];

    ArrayList<String> words = wordSuggestion.search(word);

    printArray(words);
  }
  boolean onObject(float x, float y) {
    return (x > pos.x - size.x/2 &&
      x < pos.x + size.x/2 &&
      y > pos.y - size.y/2 &&
      y < pos.y + size.y/2);
  }
  @Override
    void mouseMoved() {
    wordSuggestion.mouseMoved();
  }
  @Override
    void keyPressed() {
    if (!userIsTyping) return;

    if (((key >= 'A' && key <= 'z') || key == ' ') && userInput.length() < 2000) {
      userInput += key;
    }

    if (key == BACKSPACE && userInput.length() > 0) {
      userInput = userInput.substring(0, userInput.length()-1);
    }

    updateUserSearch();
  }
  @Override
    void mousePressed() {
    if (userIsTyping) {
      String s = wordSuggestion.getWord();
      if (s.equals("")) return;
      String[] allUserWords = userInput.split(" ");
      String word = allUserWords[allUserWords.length-1];

      userInput = userInput.substring(0, userInput.length() - word.length());

      userInput += s;
    }
    if (onObject(mouseX, mouseY)) {
      userIsTyping = true;
    } else {
      userIsTyping = false;
    }
    updateStrokeColor();
  }
}
