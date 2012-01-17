import processing.opengl.*;

CSVMap csvMap;
Recording recording;

FrameController controller;
ArrayList<GaitPhase> phases;

void setup() {
  size(1000, 600, OPENGL);
  csvMap = new CSVMap("walking_3d.csv");
  csvMap.dataStartRow = 6;
  csvMap.labelRow = 4;
  csvMap.dataStartColumn = 2;
  csvMap.startColumn = 2;

  recording = new Recording(csvMap);
  controller = new FrameController(this, recording, 50, height - 100, width-100);

  phases = recording.detectPhases();

  println("num phases: " + phases.size());

  for (int i = 0; i < phases.size(); i++) {
    GaitPhase phase = phases.get(i); 
    println("beginning frame: " + phase.beginningFrame + "end frame: " + phase.endingFrame +  " type: " + phase.type);
  }
}

void draw() {
  background(255);
  lights();
  stroke(0);
  fill(0);
  
  
  
  controller.update();
  controller.draw();
  
  text(frameRate, 20, 20);
  
  fill(0, 255, 0);
  text("Right ankle height: " + recording.joints.get(3).positionAtFrame(recording.currentFrame).z, 20, 50);
  text("Right ankle dZ: " + recording.joints.get(3).slopeAtFrame(recording.currentFrame).z, 20, 65);
  text("Right ankle dX: " + recording.joints.get(3).slopeAtFrame(recording.currentFrame).x, 20, 80);
  

  fill(255, 0, 0);
  text("Left ankle height: " + recording.joints.get(9).positionAtFrame(recording.currentFrame).z, 20, 95);
  text("Left ankle dZ: " + recording.joints.get(9).slopeAtFrame(recording.currentFrame).z, 20, 110);
  text("Left ankle dX: " + recording.joints.get(9).slopeAtFrame(recording.currentFrame).x, 20, 125);

  

  pushMatrix();
    translate(300, 500, -100);
    scale(200);
    rotateX(radians(90));
    recording.draw();
  popMatrix();
}

void mousePressed() {
  controller.mousePressed();
}


void keyPressed() {
  controller.keyPressed();
}

void mouseDragged() {
  controller.mouseDragged();
}

