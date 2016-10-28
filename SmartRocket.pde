
/* 2016.09.26  */

class Rocket
{
  PVector location ;
  PVector velocity ;
  PVector acceleration ;
  float r ; // size
  
  float fitness ;
  // 2016.10.28 , 
  float fitnessDis ;

  DNA dna ;
  
  // To count which force we are on in the genes
  int geneCounter = 0 ;
  // Did I reach the target .
  boolean hitTarget = false ;
  
  Rocket(PVector l , DNA dna_)
  {
    location = l.get();
    velocity = new PVector(0 , 0);
    acceleration = new PVector(0 , 0);
    r = 4 ;
    dna = dna_ ;
  }
  
  void applyForce(PVector f)
  {
    acceleration.add(f);
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
   
    acceleration.mult(0); 
  }
  
  void checkedge()
  {
    if(location.x < 0 || location.x > width)
    {
      velocity.x = (-1) * velocity.x ; 
    }
    
    if(location.y < 0 || location.y > height)
    {
      velocity.y = (-1) * velocity.y ; 
    }
    
  }
  
  void display()
  {
    ellipse(location.x , location.y , 16 , 16);
    
    float theta = velocity.heading2D() + PI/2 ;
    fill(200 , 100);
    stroke(0);
    pushMatrix();
    translate(location.x , location.y);
    rotate(theta);
    
    rectMode(CENTER);
    fill(0);
    rect(-r/2 , r*2 , r/2 , r);
    rect(r/2 , r*2 , r/2 , r);
    
    fill(175);
    beginShape(TRIANGLES);
    vertex(0 , -r*2);
    vertex(-r , r*2);
    vertex(r , r*2);
    endShape();
    
    popMatrix();
  }  


  void fitness()
  {
    /* the distance .
       target (in MainClass) is one the rocket runs to .
       PVector target = new PVector(width / 2 , 24);
     */
    float d = dist(location.x , location.y , target.x , target.y);
    // fitness = one divided by distance squared
    fitness = pow(1 / d , 2);
  }

  /* 2016.10.28 pm 21:17
     more logical fitness computing
   */
  void fitnessDistance()
  {
    float dis = dist(location.x , location.y , target.x , target.y) ;
    fitnessDis = dis ;    
  }
  
  void checkTarget()
  {
    float d = dist(location.x , location.y , target.x , target.y);
    if(d < 12)
    {
      // whether has arrived .
      hitTarget = true ;
    }
  }
  
  void run()
  {
    checkTarget();
    
    // if not arrived ...
    if(!hitTarget)
    {
      // !!!! apply the running force !!!!!
      applyForce(dna.genes[geneCounter]);
      
      // loop all forces in a dna genes of a rocket !!! 
      geneCounter = (geneCounter + 1) % dna.genes.length ;
      
      update();
      
    }
    checkedge();
    display();
  }
  
  float getFitness()
  {
    return fitness ;
  }
  
  // 2016.10.28
  float getFitnessDis()
  {
    return fitnessDis ;
  }
  
  DNA getDNA()
  {
    return dna ;
  }
 
}
