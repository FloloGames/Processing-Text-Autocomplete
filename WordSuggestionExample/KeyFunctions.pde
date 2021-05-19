public class KeyFunctions {
  KeyFunctions() {
    registerMethod("keyEvent", this);
  }
  void keyEvent(final KeyEvent evt) {
    switch(evt.getAction()) {
    case KeyEvent.PRESS:
      keyPressed();
      break;
    case KeyEvent.RELEASE:
      keyReleased();
      break;
    case KeyEvent.TYPE:
      keyTyped();
      break;
    }
  }
  void keyPressed() {
  }
  void keyTyped() {
  }
  void keyReleased() {
  }
}
