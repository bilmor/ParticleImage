// Demo of forces + particle system
// Particles interact with a list of "Repeller" objects
// Daniel Shiffman <http://www.shiffman.net>

// Created 28 Feb 2008

// Mutated by Bill Morgan

ParticleSystem ps;
ArrayList repellers;
ArrayList attractors;

float dR, dG, dB, distance;
PImage  picture;
//int pictureLeft, pictureTop, pictureRight, pictureBottom;
int pictureLeft, pictureTop, pictureWidth, pictureHeight, pictureRight, pictureBottom;

//ArrayList particles;

void setup() 
{
  size(600, 800);
  colorMode(RGB, 255, 255, 255, 100);
  background(200);
  //  smooth();

  // Create a list of Attractor objects

  attractors = new ArrayList();
  attractors.add(new Attractor(300, 600));
  //  attractors.add(new Attractor(275, 500));

  pictureLeft   = 200;
  pictureTop    = 500;
  pictureHeight = 200;
  pictureWidth  = 200;
  pictureRight  = pictureLeft + pictureWidth;
  pictureBottom = pictureTop  + pictureHeight;

  picture.loadPixels();

  ps = new ParticleSystem(400, new PVector(width/2, height/8, 0));
}

void draw() 
{
  background(200);
  image(picture, pictureLeft, pictureTop);

  // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.10, 0);
  ps.applyForce(gravity);

  // Apply attractor objects to all Particles
  ps.applyAttractors(attractors);

  ps.run();
  picture.updatePixels();

  // Add more particles
  ps.addParticle();
  ps.addParticle();
//  ps.addParticle();
//  ps.addParticle();
//  ps.addParticle();

  // Display all attractors
  //      for (int i = 0; i < attractors.size(); i++) {
  //        Attractor r = (Attractor) attractors.get(i); 
  //          r.display();
  //      }
}

