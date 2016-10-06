
/* 2016.09.26 */

int lifetime ; // How long should each generation live
int lifeCounter ;
PVector target ;
Population population ;

void setup()
{
    size(640 , 360);
    
    lifetime = 1080 ;
    lifeCounter = 0 ;
    target = new PVector(width / 2 , 24);
    
    float mutationRate = 0.01 ;
    population = new Population(mutationRate , 50);
    
}


void draw()
{
  background(255) ;
  
  fill(0);
  ellipse(target.x , target.y , 24 , 24) ;
  
  if(lifeCounter < lifetime)
  {
    population.live() ;
    lifeCounter++ ;
    //println("lifeCunter = " + lifeCounter);
  }
  else
  {
    println("production start");
    println("Generations : " + population.getGenerations());
    lifeCounter = 0 ;
    population.fitness() ;
    population.selection() ;
    println("Max fitness rate : " + population.getMaxFitness() * 100 + " %");
    population.reproduction() ;
  }
  

}





