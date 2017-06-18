
/* 2016.09.26 
   2017.06.19 , reassign code-blocks 
*/

class DNA
{
  // the genetic sequence
  PVector[] genes ;
  
  float maxForce = 0.1 ;

  /************** DNA-building component , start **********/
  
  DNA()
  {
    // lifetime (in MainClass) = How long should each generation live
    genes = new PVector[lifetime] ;

    // construct vector array factors ...
    for(int i = 0 ; i < genes.length ; i++)
    {
      float angle = random(TWO_PI) ;
      genes[i] = new PVector(cos(angle) , sin(angle)) ;
      genes[i].mult(random(0 , maxForce)) ;
    }
    
  }
  
  // constructor #2
  DNA(PVector[] newGenes)
  {
    genes = newGenes ;
  }

  /************** DNA-building component , end **********/

  
  /************** reproduction component , start **********/

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
  
  void mutate(float m)
  {
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
  
  /************** reproduction component , end **********/
  

}
