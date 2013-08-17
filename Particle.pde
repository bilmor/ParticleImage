// Particles + Forces
// Daniel Shiffman <http://www.shiffman.net>

// A simple Particle class
// Incorporates forces code

// Mutated by Bill Morgan


class Particle 
{
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  color col;

  //  constructor with "tolerance"
  Particle(PVector l, int t) 
  {
    acc = new PVector(0, 0.5, 0);
    vel = new PVector(random(-1, 1), random(-2, 0), 0); 
    loc = l.get();        //new PVector(l.x, l.y, l.z); //l.copy();
    loc.x = loc.x + random(-t, t);
    r = random(2.0, 5.0);
    col = color(random(0, 255), random(0, 255), random(0, 255));
  }


  void run() 
  {
    update();
    render();
  }

  // Method to update location
  void update() 
  {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force)
  {
    acc.add(force);
  }


  // Method to display
  void render()
  {
    ellipseMode(CENTER);
    noStroke();

    fill(col);
    ellipse(loc.x, loc.y, r, r);
    
    if (loc.x > pictureLeft && loc.x < pictureRight && loc.y > pictureTop && loc.y < pictureBottom-1)
    {
      picture.pixels[(int)(loc.y-pictureTop)*pictureWidth   + (int)loc.x-pictureLeft]   = col;
      picture.pixels[(int)(loc.y-pictureTop)*pictureWidth+1 + (int)loc.x-pictureLeft]   = col;
      picture.pixels[(int)(loc.y-pictureTop)*pictureWidth   + (int)loc.x-pictureLeft+1] = col;
      picture.pixels[(int)(loc.y-pictureTop)*pictureWidth+1 + (int)loc.x-pictureLeft+1] = col;
    }
 }

  // Is the particle still useful?
  boolean dead() 
  {
    if (loc.x < 0 || loc.x > width || loc.y > height) 
    {
      return true;
    }
    else 
    {
      return false;
    }
  }
}

