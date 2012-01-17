class GaitPhase {
  int beginningFrame;
  int endingFrame;
  int type;
  
  static final int SINGLE_SUPPORT_LEFT = 0;
  static final int SINGLE_SUPPORT_RIGHT = 1;
  static final int DOUBLE_SUPPORT = 2;
  
  GaitPhase(int beginningFrame, int endingFrame, int type){
    this.beginningFrame = beginningFrame;
    this.endingFrame = endingFrame;
    this.type = type;
  }
  
  color phaseColor(){
    color result = color(255);
    switch(type) {
    case SINGLE_SUPPORT_RIGHT: 
      result = color(255,100,100);
      break;
      case SINGLE_SUPPORT_LEFT:
      result = color(100,255,100);
      break;
      case DOUBLE_SUPPORT: 
      result = color(100,100,255);
      break;
    }  

  return result;
  } 
}
