
/* 2016.09.26 */

int lifetime ; // How long should each generation live
int lifeCounter ;
PVector target ;
Population population ;

ArrayList<Obstacle> obstacles ;

void setup()
{
    size(640 , 360);
    
    lifetime = 3240 ;
    lifeCounter = 0 ;
    target = new PVector(width / 2 , 24);
    
    float mutationRate = 0.1 ;
    population = new Population(mutationRate , 50);
    
    obstacles = new ArrayList<Obstacle>() ;
    for(int i = 0 ; i < 4 ; i++)
    {
      obstacles.add(new Obstacle(random(0 , width - 50) , 
                                 random(0 , height - 10) , 50 , 10));
    }
}


void draw()
{
  background(255) ;
  
  fill(0);
  ellipse(target.x , target.y , 24 , 24) ;
  
  if(lifeCounter < lifetime)
  {
    population.live(obstacles) ;
    lifeCounter++ ;
  }
  else
  {
    println("Generations : " + population.getGenerations());

    lifeCounter = 0 ;
    population.fitness() ;
    population.selection() ;
    println("ave distance : " + population.fitnessDisAve());
    //println("Max fitness rate : " + population.getMaxFitness() * 100 + " %");

    population.reproduction() ;

  }
  
  for(Obstacle ob : obstacles) {
    ob.display();
  }
}
