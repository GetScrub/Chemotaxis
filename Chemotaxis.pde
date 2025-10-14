 //declare bacteria variables here   
 int[] radii = {0,0,100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500};
 int globalDanger = 0;
 int globalDangerLevel = 0;
 Bacteria[] bob = new Bacteria[20];
 void setup()   
 {     
   size(1500,1500);
   //initialize bacteria variables here   
   for (int i = 0; i<bob.length;i++){
     bob[i] = new Bacteria();
   }
   
 }   
 void draw()   
 {    
   background(255);
   for(int i = 0; i<bob.length;i++){
     bob[i].move();
     bob[i].show();
     bob[i].danger++;
     //System.out.println(Math.abs(bob[i].myX-500)+Math.abs(bob[i].myY-500));
     //System.out.println(radii[bob[i].dangerLevel]);
   }
   
   if(globalDanger%75==0){
     globalDangerLevel++;
   }
   globalDanger++;
   //System.out.println(globalDangerLevel);
   fill(#FF0000);
   ellipse(500,500,radii[globalDangerLevel]*2,radii[globalDangerLevel]*2);
   //Make the text 
   textSize(32);
   fill(0);
   text("RUN!",465,400);
 }  
 class Bacteria    
 {     
   int myX,myY;
   int myCol1, myCol2, myCol3, myOpacity;
   int danger, dangerRequirement, dangerLevel;
   int[] radii = {0,0,100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500};
   boolean show;
   Bacteria(){
     myX=500;
     myY=500;
     myCol1 = (int)(Math.random()*256);
     myCol2 = (int)(Math.random()*256);
     myCol3 = (int)(Math.random()*256);
     show = true;
     danger = 0;
     dangerRequirement=75;
     dangerLevel = 0;
     //myOpacity = (int)(Math.random()*100);
   }
   void move(){
     int aH = (int)(Math.random()*8);
     int aV = (int)(Math.random()*8);
     //first determines left/right
     if(Math.random()<0.5){
        aH = 0 - aH;
     }
     //second determines up/down
     if(Math.random()<0.5){
         aV = 0 - aV;
     }
     //Determine if the bacteria is moving towards or away from the center(horizontally): 500,500
     if(Math.abs(myX+aH-500)>Math.abs(myX-500)){
       aH=(int) (aH*(Math.random()*4));;
     }
     //Determine if the bacteria is moving towards or away from the center(vertically): 500,500
     if(Math.abs(myY+aV-500)>Math.abs(myY-500)){
       aV= (int) (aV*(Math.random()*4));
     }
     //Randomize vertical and horizontal directions
     if(Math.random()<0.5){
         aV = (int)(aV *0.5);
     }else{
       aH = (int)(aH *0.5);
     }
     myX+=aH;
     myY+=aV;
     if(danger%dangerRequirement==0){
       dangerLevel++;
       //show = true;
     }
     if(dangerLevel<17){
       //System.out.println(Math.abs(myX-500));
       //System.out.println(Math.abs(myY-500));
       //System.out.println(Math.abs(myX-500)+Math.abs(myY-500));
       //System.out.println(Math.abs(radii[dangerLevel]));
       //System.out.println(dangerLevel);
       //if( (myX - 500)*(myX - 500) + (myY - 500)*(myY - 500) >= radii[dangerLevel]*radii[dangerLevel]){
       if(Math.pow(myX-500,2)+Math.pow(myY-500,2)<Math.pow(radii[dangerLevel],2)){
         show = false;
       }
     }else{
       show = false;
     }
   }

   void show(){
     if(show){ 
       fill(myCol1,myCol2,myCol3);
       ellipse(myX,myY,5,5);
     }
     //System.out.println(show);
   }
   //lots of java!   
 }    
