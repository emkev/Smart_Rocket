
/* 2016.09.26 */

class DNA
{
  // singal for single engine
  // the genetic sequence
  PVector[] genes ;
  //PVector genes ;
  
  float maxForce = 0.1 ;
  
  DNA()
  {
    // singal for single engine
    // lifetime (in MainClass) = How long should each generation live
    genes = new PVector[lifetime] ;

    // singal for single engine
    /*
    float angle = random(TWO_PI);
    genes = new PVector(cos(angle) , sin(angle)) ;
    genes.mult(random(0 , maxForce)) ;
    */
    
    // singal for single engine    
    // construct vector array factors ...
    for(int i = 0 ; i < genes.length ; i++)
    {
      float angle = random(TWO_PI) ;
      genes[i] = new PVector(cos(angle) , sin(angle)) ;
      genes[i].mult(random(0 , maxForce)) ;
    }
    
  }
  
  // singal for single engine
  // constructor #2
  DNA(PVector[] newGenes)
  {
    genes = newGenes ;
  }

  /*
  DNA(PVector newGenes)
  {
    genes = newGenes ;
  }
  */
  
  // singal for single engine  
  DNA crossover(DNA partner)
  {

    PVector[] childgenes = new PVector[genes.length] ;
    
    int crossover = int(random(genes.length)) ;
    
    for(int i = 0 ; i < genes.length ; i++)
    {
      if(i > crossover) 
        childgenes[i] = genes[i] ;
      else 
        childgenes[i] = partner.genes[i] ;
    }
    
    // build new DNA object with the new composed genes array 
    DNA newDna = new DNA(childgenes);
    
    return newDna ;
  }

  
  // singal for single engine
  /*
  DNA crossover(DNA partner)
  {
    PVector childgenes = new PVector() ;

    childgenes = genes ;
    childgenes.add(partner.genes);
    
    DNA newDna = new DNA(childgenes) ;
    return newDna ;
  }
  */
  
  void mutate(float m)
  {
    // singal for single engine

    for(int i = 0 ; i < genes.length ; i++)
    {
      if(random(1) < m)
      {
        float angle = random(TWO_PI) ;
        genes[i] = new PVector(cos(angle) , sin(angle)) ;
        genes[i].mult(random(0 , maxForce));
      }
    }
    
    
  }
 
}
