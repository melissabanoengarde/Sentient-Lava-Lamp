//Melissa Banoen-Garde 2020
//Blob b;

Blob[] blobs = new Blob [10];


void setup() {
  size (1280, 800);
  colorMode(HSB);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob (random(width), random(height));
  }
  //b = new Blob (100, 100); 
}

void draw() {
  background (51);

  loadPixels();
  for (int x = 5; x < width; x++) {
  for (int y = 0; y < height; y++) {
    int index = x + y * width;
    float sum = 0;  //pixels in array 
    for (Blob b: blobs) {
    float d = dist (x, y, b.pos.x, b.pos.y);
    sum += 30 * b.r / d;
    }
    pixels [index] = color (sum, 225, 552);
    //pixels [index] = color (sum, 255, 255);
    //pixels [index] = color (constrain(sum, 0, 220), 255, 255);
   //pixels [index] = color (sum % 255, 255, 255);//color of pixels, every pixel is a function of x + y
  }
  
  }

  updatePixels();

saveFrame ("frames/####.png");

for (Blob b: blobs) {
b.update();
//b.show ();

}
}
