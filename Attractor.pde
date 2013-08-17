// Particles + Forces
// Daniel Shiffman <http://www.shiffman.net>

// Mutated by Bill Morgan

// A very basic Attractor class
class Attractor 
{
  // Location
  PVector loc;
  // PImage  picture;

  Attractor(float x, float y) 
  {
    loc = new PVector(x, y);

    picture = createImage(200, 200, RGB);
    picture.loadPixels();
    for (int i = 0; i < picture.pixels.length; i++) 
    {
      picture.pixels[i] = color(i%200+30, 75, (255-i)%200);
    }
    picture.updatePixels();
    image(picture, 200, 500);
  }

  void display() 
  {
    stroke(0);
    noFill();
    ellipse(loc.x, loc.y, 20, 20);
  }

  // Calculate a force to pull particle toward attractor
  PVector pullParticle(Particle p) 
  {
    //    PVector dir = PVector.sub(loc, p.loc);      // Calculate direction of force
    PVector dir = PVector.sub(loc, p.loc);      // Calculate direction of force
    float d = dir.mag();                   // Distance between objects
    if ( d > 4)    //threshold
    {
      dir.normalize();                             // Normalize vector (distance doesn't matter here, we just want this vector for direction)
      float force = 250.0 / (d * d);              // Attracting force is inversely proportional to distance
      dir.mult(force);        // Get force vector --> magnitude * direction
    }
    else
    {
      dir.set(0, 0, 0);
    }
//   float junk = getColorDistance(p.picture.pixels);
    return dir;
  }

//  float getColorDistance()
//  {
//    for (int i=0; i<picture.pixels.length; i+=4) 
//    {
//      for (int j=0; j< particles.size(); j++)
//      { 
//        Particle part = (Particle) particles.get(j);
//
//        //      dR = red  ( part.col) -   red  (picture.pixels[i]);
//        //      dG = green( part.col) -   green(picture.pixels[i]);
//        //      dB = blue ( part.col) -   blue (picture.pixels[i]);
//        dR = ((part.col >> 16) & 0xff) - ((picture.pixels[i] >> 16) & 0xff);
//        dG = ((part.col >>  8) & 0xff) - ((picture.pixels[i] >>  8) & 0xff);
//        dB = ((part.col      ) & 0xff) - ((picture.pixels[i]      ) & 0xff);
//        float distance = sqrt(dR*dR + dG*dG + dB*dB);
//
//        //      PVector vpart = (PVector)particles.get(j);
//        //      PVector vcol  = (PVector)picture.pixels[i];
//      }
//    }
//    return distance;
//  }

// float getColorDistance(Particle p)
//  {
////    for (int i=0; i<picture.pixels.length; i+=4) 
////    {
////      for (int j=0; j< particles.size(); j++)
////      { 
////
//
//        //      dR = red  ( part.col) -   red  (picture.pixels[i]);
//        //      dG = green( part.col) -   green(picture.pixels[i]);
//        //      dB = blue ( part.col) -   blue (picture.pixels[i]);
//        dR = ((p.col >> 16) & 0xff) - ((picture.pixels[i] >> 16) & 0xff);
//        dG = ((p.col >>  8) & 0xff) - ((picture.pixels[i] >>  8) & 0xff);
//        dB = ((p.col      ) & 0xff) - ((picture.pixels[i]      ) & 0xff);
//        float distance = sqrt(dR*dR + dG*dG + dB*dB);
//
//        //      PVector vpart = (PVector)particles.get(j);
//        //      PVector vcol  = (PVector)picture.pixels[i];
////      }
////    }
//    return distance;
//  }

}

