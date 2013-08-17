// Particles + Forces
// Daniel Shiffman <http://www.shiffman.net>

// Mutated by Bill Morgan

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 
// Functions are added to apply forces to all particles
// and all particles interact with Repeller objects

class ParticleSystem {

  ArrayList particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are birthed

  ParticleSystem(int num, PVector v) 
  {
    particles = new ArrayList();              // Initialize the arraylist
    origin = v.get();                         // Store the origin point
    for (int i = 0; i < num; i++) 
    {
      particles.add(new Particle(origin,num/2));    // Add "num" amount of particles to the arraylist
    }
  }


  // A function to apply a force to all Particles
  void applyForce(PVector f) 
  {
    for (int i = 0; i < particles.size(); i++) 
    {
      Particle p = (Particle) particles.get(i);
      p.applyForce(f);
    }
  }

  // A function for particles to interact with all Attractors
  void applyAttractors(ArrayList b) 
  {
    // For every Particle
    for (int i = 0; i < particles.size(); i++) 
    {
      Particle p = (Particle) particles.get(i);
      // For every Attractor
      for (int j = 0;  j < attractors.size(); j++) 
      {
        Attractor a = (Attractor) attractors.get(j);
        // Calculate and apply a force from Attractor to Particle
        PVector attract = a.pullParticle(p);        
        p.applyForce(attract);
      }
    }
  }

  void run() {
    // Cycle through the ArrayList backwards b/c we are deleting
    for (int i = particles.size()-1; i >= 0; i--) 
    {
      Particle p = (Particle) particles.get(i);
      p.run();
      if (p.dead()) 
      {
        particles.remove(i);
      }
//            print(particles.size()+" ");
    }
  }

  void addParticle() 
  {
    particles.add(new Particle(origin,100));
  }

  void addParticle(Particle p)
  {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() 
  {
    if (particles.isEmpty()) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }

}






