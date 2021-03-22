
PImage texture0,texture1,texture2,texture3,texture4;

float[][] keys = {
  { 0, 0.8, -1.5 },
  { 0.8, -0.8, -3.5 },
  { -0.8, -0.8, -2.5 }
};
int currentKey = 0;
boolean black = true;
float t = 0;
float tempz=-5;
float eyeX = 0, eyeY = 0, eyeZ = 0 , centerX = 0, centerY = 0, centerZ = -0.5, upX = 0, upY = 1, upZ = 0;
//float eyeX = 0, eyeY =0, eyeZ = 0, centerX = 0, centerY = -3, centerZ = 0, upX = 0, upY = 0, upZ = -4;
ArrayList<ArrayList<float[]>> tiles =new ArrayList();
ArrayList<float[]> blocks =new ArrayList<float[]>();
ArrayList<float[]> triblocks =new ArrayList<float[]>();
ArrayList<float[]> throneblocks =new ArrayList<float[]>();
float checkrotate=0.01;
int counting1=0,counting2=0,counting3;
boolean perspective = false;
float help=0;


boolean flag=false;

float[] rocketcord = new float[2];
float[] temprocketcord = new float[2];
void setup() {
  size(640, 640, P3D);
  hint(DISABLE_OPTIMIZED_STROKE);
  
  
   textureMode(NORMAL); // you want this!
  texture0 = loadImage("assets/brick.jpg");
  texture1 = loadImage("assets/whiteblock.jpg");
  texture2 = loadImage("assets/brick.jpg");
  texture3 = loadImage("assets/seam.jpg");
  texture4 = loadImage("assets/dot.jpg");
    textureWrap(REPEAT);
  
  
  final  float CHEK=0.2;
  
  for (float zf = -5; zf < 0; zf += CHEK){
    
   
    ArrayList<float[]> temp=new ArrayList<float[]>();
  for (float xf = -1; xf < 1; xf += CHEK)   {
      
     float[] temp1=new float[2];
     temp1[0]=zf;
     temp1[1]=xf;
     temp.add(temp1);
         
      
    }
    
    tiles.add(temp);
    
    //blocks
    if(tiles.size()%5==0)
    {
      float tempminus=-1;
        int rand= (int)random(0,11);
        
        for(int i=0;i< rand;i++)
        {
          tempminus+=0.2;
        }
        float[] temp1={zf,tempminus};
        blocks.add(temp1);
   }
   
   
   //triangle block
          if(tiles.size()%7==0)
    {
      float tempminus=-1;
        int rand= (int)random(0,11);
        
        for(int i=0;i< rand;i++)
        {
          tempminus+=0.2;
        }
        float[] temp1={zf,tempminus};
        triblocks.add(temp1);
   }
   
   
   //throneblock
   
   if(tiles.size()%9==0)
    {
      float tempminus=-1;
        int rand= (int)random(0,11);
        
        for(int i=0;i< rand;i++)
        {
          tempminus+=0.2;
        }
        float[] temp1={zf,tempminus};
        throneblocks.add(temp1);
   }
   
       
  }
  rocketcord[0]= tiles.get(tiles.size()-8).get(4)[0];
  rocketcord[1]= tiles.get(tiles.size()-8).get(4)[1];
  
  temprocketcord[0]= tiles.get(tiles.size()-10).get(4)[0];
  temprocketcord[1]= tiles.get(tiles.size()-10).get(4)[1];
 
}

void draw() {
  
  
  
  
  
  float[] start = keys[currentKey];
  float[] end = keys[(currentKey + 1) % keys.length];
  float x, y, z, angle;
clear();
  resetMatrix();
  
  
  
  if (perspective)
  {
    frustum(-1, 1, 1, -1, 1, 100);
    camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
    
     
     
      
  }
  else
  {
    ortho(-1, 1, 1, -1, 1, 8);
    
     camera(-0.1,0.9,eyeZ,-0.041,0.5,centerZ,0,1,1);
  }



  stroke(255,255,255);
  if(flag==false)
  {
eyeZ-=0.010;
centerZ-=0.010;
  }
  
  
  
  if(blast1)
  {
    
    ps.addParticle();
    ps.run();
    
  }
//println("eyez"+eyeZ/10);


 if(flag==false)
 {
  
  help-=(0.10*10);
 
  if(help/10<=-2)
  {
      tempz=tempz-0.2;  
      ArrayList<float[]> temporary= new ArrayList<float[]>();
for (float xf = -1; xf < 1; xf += 0.2)   {
      
     float[] temp1=new float[2];
     temp1[0]=tempz;
     temp1[1]=xf;
     temporary.add(temp1);
         
    //  println("xf:"+xf+" zf "+tempz);
    }
      //block  
    if(counting1==0)
    {
    float tempminus1=-1;
        int rand1= (int)random(0,11);
        
        for(int i=0;i< rand1;i++)
        {
          tempminus1+=0.2;
        }
        float[] temp2={tempz,tempminus1};
        blocks.add(0,temp2);
        blocks.remove(blocks.size()-1);
        
    }
    counting1++;
    if(counting1 > 5)
    {
      counting1=0;
    }
    
    
    
    //triangleblock
      if(counting2==0)
    {
    float tempminus1=-1;
        int rand1= (int)random(0,11);
        
        for(int i=0;i< rand1;i++)
        {
          tempminus1+=0.2;
        }
        float[] temp2={tempz,tempminus1};
        triblocks.add(0,temp2);
        triblocks.remove(triblocks.size()-1);
        
    }
    counting2++;
    if(counting2 > 7)
    {
      counting2=0;
    }
    
    
    
    
    //throneblock
    
    if(counting3==0)
    {
    float tempminus1=-1;
        int rand1= (int)random(0,11);
        
        for(int i=0;i< rand1;i++)
        {
          tempminus1+=0.2;
        }
        float[] temp2={tempz,tempminus1};
        throneblocks.add(0,temp2);
        throneblocks.remove(throneblocks.size()-1);
        
    }
    counting3++;
    if(counting3 > 9)
    {
      counting3=0;
    }
    
    
    
    
    tiles.add(0,temporary);
     tiles.remove((tiles.size()-1));   
    help=0;
    
    
    //rocket
    
 
  }
 }
  
  
  //String rx=nf(rocketcord[1],0,3);
  //rocketcord[1]=float(rx);
  
  // String rz=nf(rocketcord[0],0,3);
  //rocketcord[0]=float(rz);
  //for(int m=0;m<blocks.size();m++)
  //{
  //  String bx=nf(blocks.get(m)[1],0,3);
  //  blocks.get(m)[1]=float(bx);
    
  //   String bz=nf(blocks.get(m)[0],0,3);
  //  blocks.get(m)[0]=float(bz);
    
  // System.out.println("blocksz:"+blocks.get(m)[0]+"rocketz:"+rocketcord[0]); 
  // System.out.println("blocksx:"+blocks.get(m)[1]+"rocketx:"+rocketcord[1]); 
   
  // if(blocks.get(m)[0]==rocketcord[0] && rocketcord[1]== blocks.get(m)[1])
  // {
  //   System.out.println("blocksz:"+blocks.get(m)[0]+"rocketz:"+rocketcord[0]); 
  // System.out.println("blocksx:"+blocks.get(m)[1]+"rocketx:"+rocketcord[1]);
  //   flag=true;
  // }
    
    
    
    
    
    
    
    
    
    //for temp
    
    String rx1=nf(temprocketcord[1],0,3);
  temprocketcord[1]=float(rx1);
  
   String rz1=nf(temprocketcord[0],0,3);
  temprocketcord[0]=float(rz1);
  for(int m=0;m<blocks.size();m++)
  {
    String bx=nf(blocks.get(m)[1],0,3);
    blocks.get(m)[1]=float(bx);
    
     String bz=nf(blocks.get(m)[0],0,3);
    blocks.get(m)[0]=float(bz);
    
   //System.out.println("blocksz:"+blocks.get(m)[0]+"rocketz:"+rocketcord[0]); 
   //System.out.println("blocksx:"+blocks.get(m)[1]+"rocketx:"+rocketcord[1]); 
   
   if(blocks.get(m)[0]==temprocketcord[0] && temprocketcord[1]== blocks.get(m)[1] && rockettranslate<-0.6)
   {
     flag=true;
     
     
   }
    
  } 
    //triblock
    
    
    for(int m=0;m<triblocks.size();m++)
  {
    String bx=nf(triblocks.get(m)[1],0,3);
    triblocks.get(m)[1]=float(bx);
    
     String bz=nf(triblocks.get(m)[0],0,3);
    triblocks.get(m)[0]=float(bz);
    
   //System.out.println("blocksz:"+blocks.get(m)[0]+"rocketz:"+rocketcord[0]); 
   //System.out.println("blocksx:"+blocks.get(m)[1]+"rocketx:"+rocketcord[1]); 
   
   if(triblocks.get(m)[0]==temprocketcord[0] && temprocketcord[1]== triblocks.get(m)[1] && rockettranslate<-0.6)
   {
     flag=true;
   }
    
  }
  
  
  
  //throneblock
  
    for(int m=0;m<throneblocks.size();m++)
  {
    String bx=nf(throneblocks.get(m)[1],0,3);
    throneblocks.get(m)[1]=float(bx);
    
     String bz=nf(throneblocks.get(m)[0],0,3);
    throneblocks.get(m)[0]=float(bz);
    
   //System.out.println("blocksz:"+blocks.get(m)[0]+"rocketz:"+rocketcord[0]); 
   //System.out.println("blocksx:"+blocks.get(m)[1]+"rocketx:"+rocketcord[1]); 
   
   if(throneblocks.get(m)[0]==temprocketcord[0] && temprocketcord[1]== throneblocks.get(m)[1] && rockettranslate<-0.6)
   {
     flag=true;
   }
    
  }
  
  
  
  
  
 // println("aaaaaaaaa:  "+rocketcord[0]+"bbbb:  " +rocketcord[1]);
 if(flag==false)
 {
    rocketcord[0]-=0.01;
    temprocketcord[0]-=0.01;
 }
      drawTiles(texture0,texture2);  
 

 
 

  t = t + 0.01 / dist(start[0], start[1], end[0], end[1]);
  if (t > 1) {
    t = 0;
    currentKey = (currentKey + 1) % keys.length;
  }
}
 

//---------------------------------------------------------------------------------------
float rockettranslate=-1;
void drawTiles(PImage pi, PImage pi1)
{int counting4=0,counting5=0,counting6=0;
 // println(tiles.size());
    final float CHEK = 0.2;
  PImage temp3;
      for(int i=0;i<tiles.size();i++)
      {
             //rocket
             
             pushMatrix();
             translate(rocketcord[1]+0.1,rockettranslate,rocketcord[0]);
             if(check==true)
             {
              check=false;
              rotateZ(7);
             }
             
             if(check1==true)
             {
              check1=false;
              rotateZ(-7);
             }
             
             scale(0.7);
             rotateY(1.57);
             fill(255,200,0);
             drawRocket();
             popMatrix();
             
        
        //throneblock
        if(i%9==0)
        {
          float[] temp2=throneblocks.get(counting6);
               pushMatrix();
           counting6++;
      translate(temp2[1]+0.1,-1,temp2[0]+0.1);
      rotateY(checkrotate);
      scale(0.6,0.3,0.6);
        checkrotate+=0.001;
          drawThrone(texture4);
      popMatrix(); 
        }
        
        
        
        
        
        
       //block
        if(i%5==0)
        {
          float[] temp2=blocks.get(counting4);
               pushMatrix();
           counting4++;
      translate(temp2[1]+0.1,-1,temp2[0]+0.1);
      rotateY(checkrotate);
      scale(0.06,0.3,0.06);
        checkrotate+=0.01;
          drawShape(texture1);
      popMatrix(); 
        }
       //triangle block
       
       if(i%7==0)
        {
          float[] temp2=triblocks.get(counting5);
               pushMatrix();
           counting5++;
      translate(temp2[1]+0.1,-1,temp2[0]+0.1);
      rotateY(checkrotate);
      scale(0.1,0.3,0.1);
        checkrotate+=0.01;
          drawTriangle(texture3);
      popMatrix(); 
        }
       if(counting5==triblocks.size())
        {
         counting5=0; 
        }
       
       
       if(counting6==throneblocks.size())
        {
         counting6=0; 
        }
       
       
        if(counting4==blocks.size())
        {
         counting4=0; 
        }
         for(int j=0;j<tiles.get(i).size();j++)
         {
           
           if(j%2==0)
           {
             temp3=pi;
           }else
           {
             temp3=pi1;
             
           }
           float[] temp=tiles.get(i).get(j);
           float zf=temp[0];
           float xf=temp[1];
           
           
         
           
           
           noStroke();
          
      float  m=0.3;
             beginShape(QUADS);
             texture(temp3);
         vertex(xf, -1, zf,0,m);
          vertex(xf + CHEK, -1, zf,m,m);
            vertex(xf + CHEK, -1, zf + CHEK,m,0);
              vertex(xf, -1, zf + CHEK,0,0);
            endShape();
   
      black = !black;
      //     pushMatrix();
           
      //translate(-0.5,-1,-2.5);
      //rotateY(checkrotate);
      //scale(0.06,0.3,0.06);
      //  checkrotate+=0.0001;
      //    drawCube();
      //popMatrix();
      
          
         }

        
      }
      
      
}




void drawShape(PImage pi) {
  float m= 0.3;
  beginShape(QUADS);
  texture(pi);
  
  vertex(-1,-1,1,0,m);
  vertex(-1,1,1,m,m);
  vertex(1,1,1,m,0);
  vertex(1,-1,1,0,0);

  
  vertex(1,-1,1,0,m);
  vertex(1,-1,-1,m,m);
  vertex(1,1,-1,m,0);
  vertex(1,1,1,0,0);

  
  vertex(1,-1,-1,0,m);
  vertex(-1,-1,-1,m,m);
  vertex(-1,1,-1,m,0);
  vertex(1,1,-1,0,0);

  
  vertex(-1,-1,-1,0,m);
  vertex(-1,-1,1,m,m);
  vertex(-1,1,1,m,0);
  vertex(-1,1,-1,0,0);

  
  vertex(-1,1,1,0,m);
  vertex(1,1,1,m,m);
  vertex(1,1,-1,m,0);
  vertex(-1,1,-1,0,0);

  
  vertex(1,-1,1,0,m);
  vertex(-1,-1,1,m,m);
  vertex(-1,-1,-1,m,0);
  vertex(1,-1,-1,0,0);

  endShape();
}
boolean check=false,check1=false;
float tempzfire;
void keyPressed() {
  switch (key) {
 
  case ' ':
    perspective = !perspective;
    break;
    
    case 'a':
    if(rocketcord[1]>-1)
    {
     rocketcord[0]= tiles.get(tiles.size()-8).get(3)[0];
  rocketcord[1]-=0.2;
    temprocketcord[0]= tiles.get(tiles.size()-10).get(3)[0];
  temprocketcord[1]-=0.2;
    check=true;
    flag=false;
    
    
    ps=new ParticleSystemSmoke(rocketcord[1]+0.10,rockettranslate-0.01,rocketcord[0]);
    tempzfire=rocketcord[0];
    blast1=true;
    if(rockettranslate>-0.6)
    {
     flag=false; 
    }
    
    }
    break;
    
     case 'd':
     if(rocketcord[1]<0.9)
     {
     rocketcord[0]= tiles.get(tiles.size()-8).get(3)[0];
  rocketcord[1]+=0.2;
    temprocketcord[0]= tiles.get(tiles.size()-10).get(3)[0];
  temprocketcord[1]+=0.2;
  check1=true;
    flag=false;
    
    ps=new ParticleSystemSmoke(rocketcord[1]+0.10,rockettranslate-0.01,rocketcord[0]);
    tempzfire=rocketcord[0];
    blast1=true;
    if(rockettranslate>-0.6)
    {
     flag=false; 
    }
    
     }
    break;
    
    case 'w':
    rockettranslate+=0.10;
    ps=new ParticleSystemSmoke(rocketcord[1]+0.10,rockettranslate-0.01,rocketcord[0]);
    tempzfire=rocketcord[0];
    blast1=true;
    if(rockettranslate>-0.6)
    {
     flag=false; 
    }
    break;
    
    case 's':
    if(rockettranslate>-1)
    {
    rockettranslate-=0.10;
    
    ps=new ParticleSystemSmoke(rocketcord[1]+0.10,rockettranslate-0.01,rocketcord[0]);
    tempzfire=rocketcord[0];
    blast1=true;
    if(rockettranslate>-0.6)
    {
     flag=false; 
    }
    
    }
    break;
  }
  println("\n");
  println("eye    = (", eyeX+"," , eyeY+"," , eyeZ+"," , ")"); 
  println("center = (", centerX+"," , centerY+"," , centerZ+"," , ")"); 
  println("up     = (", upX+"," , upY+"," , upZ+"," , ")"); 
}




//drawing cube 

void drawCube() {
  fill(78,78,78);
  beginShape(QUADS);

    vertex(-1,-1,1);
  vertex(-1,1,1);
  vertex(1,1,1);
  vertex(1,-1,1);

  
  vertex(1,-1,1);
  vertex(1,-1,-1);
  vertex(1,1,-1);
  vertex(1,1,1);

  
  vertex(1,-1,-1);
  vertex(-1,-1,-1);
  vertex(-1,1,-1);
  vertex(1,1,-1);

  
  vertex(-1,-1,-1);
  vertex(-1,-1,1);
  vertex(-1,1,1);
  vertex(-1,1,-1);

  
  vertex(-1,1,1);
  vertex(1,1,1);
  vertex(1,1,-1);
  vertex(-1,1,-1);

    vertex(1,-1,1);
  vertex(-1,-1,1);
  vertex(-1,-1,-1);
  vertex(1,-1,-1);

  endShape();
}


//draw 3D triangle


void drawTriangle(PImage pi) {
  stroke(255);
//scale(0.5);
rotateX(-PI/2);
rotateZ(+PI/6);
float m =0.8;
  beginShape(TRIANGLES);
  texture(pi);
vertex(-1, -1, -1,0,m);
vertex( 1, -1, -1,m,m);
vertex(   0,    0,  1,m,0);

vertex( 1, -1, -1,0,m);
vertex( 1,  1, -1,m,m);
vertex(   0,    0,  1,m,0);

vertex( 1, 1, -1,0,m);
vertex(-1, 1, -1,m,m);
vertex(   0,   0,  1,m,0);

vertex(-1,  1, -1,0,m);
vertex(-1, -1, -1,m,m);
vertex(   0,    0,  1,m,0);
endShape();
}



//rocket


float[][] rocket = {
{0,0,-0.1},
{0,0,0.1},
{0.3,0,0},

{0,0,0.1},
{-0.02,0.05,0.03},
{0.3,0,0},

{0,0,-0.1},
{-0.02,0.05,-0.03},
{0.3,0,0},

{-0.04,0.1,0},
{-0.02,0.05,-0.03},
{0.3,0,0},

{-0.04,0.1,0},
{-0.02,0.05,0.03},
{0.3,0,0},

{-0.04,0.1,0},
{-0.02,0.05,0.03},
{-0.02,0.05,-0.03},

{0,0,0.1},
{-0.02,0.05,0.03},
{-0.02,0.05,-0.03},

{0,0,-0.1},
{0,0,0.1},
{-0.02,0.05,-0.03}
};

void drawRocket()
{
   beginShape(TRIANGLES);
   fill(255,200,0);
   stroke(255);
   
  for(int i = 0; i < rocket.length;i++){
    if((i>2 && i<6) || i>5 && i<9 )
    {
       fill(255,0,0); 
    }else
    {
     fill(255,200,0); 
    }
  vertex(rocket[i][0],rocket[i][1],rocket[i][2]);
}
  endShape(); 
}



//draw throne
int thrones = 20;
float[] throneX = new float[thrones];
float[] throneY = new float[thrones];
void drawThrone(PImage Pi)
{
  // fill(0,200,0);
 
  //texture(img);
  
    float angle = 360/ thrones;
  for (int i = 0; i < thrones; i++) {
    throneX[i] = cos(radians(i * angle));
    throneY[i] = sin(radians(i * angle));
  }
  
   beginShape(QUADS);
   texture(Pi);
  for (int i = 0; i < thrones; i++) {
    float x = throneX[i] * 0.2;
    float z = throneY[i] * 0.2;
    
    vertex(x, -1, z,0,0);
    vertex(x, 1, z,0.2,0.2);
  }
  endShape(); 
}



//key Pressed





//particlesystem



boolean blast1=false;
ParticleSystemSmoke ps;


class ParticleSystemSmoke {
  ArrayList<ParticleSmoke> particles;
  float startingX;
  float startingY;
  float startingZ;

  ParticleSystemSmoke(float positionx, float positiony,float positionz) {
    startingX = positionx;
    startingZ = positionz;
    startingY = positiony;
    particles = new ArrayList<ParticleSmoke>();
  }

  void addParticle() {
    
    particles.add(new ParticleSmoke(startingX, startingY,startingZ));
    if(startingY<-0.6 && flag==true)
    {startingZ=tempzfire;
    
    }else
    {
      startingZ=tempzfire;
    tempzfire-=0.010;  
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      ParticleSmoke p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}


// A simple Particle class

class ParticleSmoke {
  float pX;
  float pY;
  float pZ;
  float velocityX;
  float velocityY;
  float velocityZ;
  float accelerationX;
  float accelerationY;
  float accelerationZ;
  float lifespan;
  float smoky;
  ParticleSmoke(float Px, float Py,float Pz) {
    accelerationX = random(-0.006,0.006);  accelerationY = -0.0098; accelerationZ = random(-0.006,0.006);
    velocityX = random(-0.02, 0.01);velocityY = random(-0.008,-0.006 ); velocityZ = random(-0.02, 0.01);
    pX = Px;
    pY = Py;
    pZ= Pz;
    lifespan = 50.0;
    smoky=255;
  }

  void run() {
 velocityX+=accelerationX;
 velocityZ+=accelerationZ;
    velocityY+=accelerationY;
    pX+=velocityX;
    pZ+=velocityZ;
    pY+=velocityY;
    lifespan -=1;
    smoky-=8;
    noStroke();
    fill(255,165,0);
    
    pushMatrix();
    translate(pX,pY,pZ);
    texture(texture1);
    sphere(0.018);
    popMatrix();
  }

  // Method to update position
 

  boolean isDead() {
    if (lifespan < 0.0) {
      
      blast1= false;
      return true;
    } else {
      return false;
    }
  }
}
