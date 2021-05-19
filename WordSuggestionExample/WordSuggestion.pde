class WordSuggestion {
  ArrayList<String> suggestedWords;
  String[] allWords;

  PVector pos, size;

  int selectedIndex = 0;

  WordSuggestion(float x, float y, float sx, float sy) {
    suggestedWords = new ArrayList<String>();
    allWords = loadStrings("data/EnglishWords.txt");
    printArray(allWords);

    pos = new PVector(x, y);
    size = new PVector(sx, sy);
  }
  void show() {
    stroke(255, 0, 0);
    // if (suggestedWords.size() <= 0) return;
    for (int i = 0; i < min(suggestedWords.size(), 30); i++) {
      String s = suggestedWords.get(constrain(i, 0, suggestedWords.size()-1));
      float offsetY = i * size.y;
      if (i == selectedIndex) {
        fill(255, 0, 0);
        rect(pos.x, pos.y+offsetY, size.x, size.y);
        fill(0);
        text(s, pos.x, pos.y+offsetY, size.x, size.y);
      } else {
        fill(0);
        rect(pos.x, pos.y+offsetY, size.x, size.y);
        fill(255, 0, 0);
        text(s, pos.x, pos.y+offsetY, size.x, size.y);
      }

      println(offsetY);
    }
    println(suggestedWords.size());
  }
  String getWord() {
    if (suggestedWords.size() <= 0) return "";
    return suggestedWords.get(selectedIndex);
  }
  void mouseMoved() {
    if (suggestedWords.size() <= 0) return;

    for (int i = 0; i < 30; i++) {
      String s = suggestedWords.get(constrain(i, 0, suggestedWords.size()-1));
      float offsetY = i * size.y;
      PVector p = new PVector(pos.x, pos.y+offsetY);
      if (mouseX < p.x + size.x / 2 &&
        mouseX > p.x - size.x / 2 &&
        mouseY < p.y + size.y / 2 &&
        mouseY > p.y - size.y / 2) {
        selectedIndex = i;
      }
    }
  }
  ArrayList<String> search(String word) {
    suggestedWords.clear();
    for (String s : allWords) {
      try {
        if (word.length() > 0 && word.toLowerCase().equals(s.substring(0, word.length()).toLowerCase())) {
          suggestedWords.add(s);
        }
      } 
      catch (StringIndexOutOfBoundsException e) {
        continue;
      }
    }
    return suggestedWords;
  }
}
