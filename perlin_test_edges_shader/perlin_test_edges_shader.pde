PShader edges;
PGraphics z;

void setup() {
  size(400, 400,P2D);
  edges = loadShader("edges.glsl");
  z = createGraphics(width,height,P2D);
}

float px=0;
float py=0;


void draw() {
  background(0);
  
  int pas=20;
  float passB=0.5;

  z.beginDraw();

  for (int i=0; i<width; i+=pas) {  
    for (int j=0; j<height; j+=pas) {  
      z.noStroke();
      float v = noise(i*0.01+px, j*0.01+py);
      
      if(v>passB){
        z.fill(map(v,passB,1,0,255));
        z.rect(i, j, pas, pas);
      }
      
    }
  }
  z.endDraw();
  
  px+=0.01;
  py+=0.01;
  shader(edges);
  
  image(z,0,0);
}