/*
The word list is from: http://www-personal.umich.edu/~jlawler/wordlist
*/

TextField textField;

String saveName = "text.txt";

void setup() {
  rectMode(CENTER);
  textAlign(LEFT, TOP);

  size(800, 800);

  textField = new TextField(width/2+width/4, height/2, width/2, height);

  loadText();
}
void draw() {
  background(0);
  textField.show();
}
void exit() {
  saveText();
}
void saveText() {
  String s = textField.userInput;
  String[] ss = s.split("\n");
  saveStrings("data/" + saveName, ss);
}
void loadText() {
  String[] ss = loadStrings("data/"+saveName);
  if(ss == null) {
    
    return; 
  }
  String text = "";
  for (String s : ss) {
    text += s;
  }
  textField.userInput = text;
  textField.updateUserSearch();
}
