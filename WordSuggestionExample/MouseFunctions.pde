public class MouseFunctions extends KeyFunctions {
  MouseFunctions() {
    registerMethod("mouseEvent", this);
  }
  void mouseEvent(final MouseEvent evt) {
    switch(evt.getAction()) {
    case MouseEvent.PRESS:
      mousePressed();
      break;
    case MouseEvent.RELEASE:
      mouseReleased();
      break;
    case MouseEvent.CLICK:
      mouseClicked();
      break;
    case MouseEvent.MOVE:
      mouseMoved();
      break;
    case MouseEvent.DRAG:
      mouseDragged();
      break;
    }
  }
  void mousePressed() {
  }
  void mouseClicked() {
  }
  void mouseReleased() {
  }
  void mouseMoved() {
  }
  void mouseDragged() {
  }
}
