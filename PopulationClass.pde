
/* 2016.09.26 */

class Population
{
  float mutationRate ;
  Rocket[] population ;
  ArrayList<Rocket> matingPool ;
  int generations ;
  
  Population(float m , int num)
  {
    mutationRate = m ; // get matation rate 
    population = new Rocket[num] ;
    matingPool = new ArrayList<Rocket>() ; // build the producion pool
    generations = 0 ;
    
    for(int i = 0 ; i < population.length ; i++)
    {
      // build Rocket objects with a location and DnaClass .
      PVector location = new PVector(width / 2 , height / 2) ;
      population[i] = new Rocket(location , new DNA()) ;
    }
  }
  
  void live()
  {
    // run every Rocket
    for(int i = 0 ; i < population.length ; i++)
    {
      population[i].run();
    }
  }
  
  void fitness()
  {
    for(int i = 0 ; i < population.length ; i++)
    {
      population[i].fitness();
    }
  }
  
  // find highest fitness in whole population
  float getMaxFitness()
  {
    float record = 0 ;
    for(int i = 0 ; i < population.length ; i++)
    {
      if(population[i].getFitness() > record)
      {
        record = population[i].getFitness();
      }
    }
    return record ;
  }
  
  
  void selection()
  {
    matingPool.clear();
    
    float maxFitness = getMaxFitness() ;
    
    for(int i = 0 ; i < population.length ; i++)
    {
      float fitnessNormal = map(population[i].getFitness() , 0 , maxFitness , 0 , 1);
      int n = (int) (fitnessNormal * 100) ;
      for(int j = 0 ; j < n ; j++)
      {
        matingPool.add(population[i]);
      }      
    }
    
  }
  
  
  void reproduction()
  {
    for(int i = 0 ; i < population.length ; i++)
    {
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      
      Rocket mom = matingPool.get(m);
      Rocket dad = matingPool.get(d);
      
      DNA momDna = mom.getDNA();
      DNA dadDna = dad.getDNA();
      DNA childDna = momDna.crossover(dadDna) ;
      // single engine
      //childDna.mutate(mutationRate) ;
      
      PVector location = new PVector(width / 2 , height + 20) ;
      population[i] = new Rocket(location , childDna) ;
    }
    
    generations++ ;
  }
  
  
  int getGenerations()
  {
    return generations ;
  }

  
}
