import g4p_controls.*;
import javax.swing.JOptionPane;
//atributos
ArrayList<Estrella> estrellas = new ArrayList();//conjunto de estrellas
ArrayList<Arista> aristas = new ArrayList();
ArrayList<Arista> aristasr = new ArrayList();
ArrayList<PImage> im = new ArrayList(); //imágenes de las estrellas
int n=0,tam=0; //variable de control para las imágenes 
PImage back,ga; //fondo
ArrayList<String> nombres = new ArrayList();

//import processing.sound.*;
   //SoundFile file;
     

public void setup(){
  
    
  back = loadImage("espacio.jpg");
  ga = loadImage("mw.jpg");
  size(900, 600, JAVA2D);
  createGUI();
  customGUI();
  PImage l;
  for(int i=1; i<=8;i++){ //cargando las imágenes en un ArrayList
    l = loadImage(i+".png");
    im.add(l);
  }
  JOptionPane.showMessageDialog(null,"Instrucciones:"+"\nPara agregar estrellas al mapa estelar haga click DERECHO en el espacio de fondo.\n"+"Podrá agregar vértices entre las estrellas, escribir sus distancias en años luz y además calcular las distancias mínimas entre ellas. \nBienvenido.\n");
}

public void draw(){
image(back,0,0,900,600);
  for(Arista a: aristas){
    stroke(255);
    int x1=a.x1,y1=a.y1,x2=a.x2,y2=a.y2;
    strokeWeight(1);
    line(x1,y1,x2,y2);
    String w = ""+a.peso;
    text(w,((x1+x2)/2)-10,((y1+y2)/2)-10);
  }
  for(Arista r: aristasr){
    int x1=r.x1,y1=r.y1,x2=r.x2,y2=r.y2;
    stroke(255,40,0);
    strokeWeight(4);
    line(x1,y1,x2,y2);
  }
  for(Estrella e: estrellas){
      image(e.star,e.x1,e.y1,50,50);
      text(e.name,e.x1+25,e.y1+60);
  }
}

boolean colisiones(int x, int y){
for(Estrella e: estrellas){
  if(x<=e.x2 && x>=e.x1 && y<=e.y2 && y>=e.y1){
      return true;
  }
}
return false;
}

void mousePressed(){
  if(mousePressed==true && mouseButton==RIGHT){
    aristasr.clear();
    int x=mouseX,y=mouseY;
    boolean ex = colisiones(x,y);
    if(!ex){
    String name = JOptionPane.showInputDialog(null,"Escriba el nombre de la estrella a insertar");
    if(name!=null){
    Estrella nueva = new Estrella(im.get(n),name); 
    if(n==7){
     n=0;
    }else{
     n+=1;
    }
    nueva.setX1(x);
    nueva.setY1(y);
    estrellas.add(nueva);
    nombres.add(nueva.name);
    star1.setEnabled(true);
    star2.setEnabled(true);
    star1.setItems(nombres,0);
    star2.setItems(nombres,0);
    }else{
      JOptionPane.showMessageDialog(null,"Por favor ingrese un nombre válido.");
    }
  }else{
  JOptionPane.showMessageDialog(null,"No es posible crear dos estrellas en la misma posición. Haga click Derecho en otra posición.");
  }
}
}
  
public void floydWar(int inicial, int fin){
  aristasr.clear();
  
int distancias[][] = new int[estrellas.size()][estrellas.size()];
int caminos[][] = new int[estrellas.size()][estrellas.size()];

            for (int i = 0; i <= estrellas.size()-1; i++) {
            for (int j = 0; j <= estrellas.size()-1; j++) {
              caminos[j][i]= i;
            }
        }


for(int i=0;i<=estrellas.size()-1;i++){
for(int j=0;j<=estrellas.size()-1;j++){
  
  Integer e[] = new Integer[estrellas.size()];
  for(Arista l: estrellas.get(i).aristas){
    e[estrellas.indexOf(l.f)]= l.peso;
    }
    if(e[j]!=null){
  distancias[i][j]=e[j];
  }else{
    if(i==j){
    distancias[i][j]=0;
    }else{
     distancias[i][j]=9999999;
    }
  }
  }
  
}

for (int f = 0; f <= estrellas.size()-1; f++) {
            for (int g = 0; g <= estrellas.size()-1; g++) {
                if (distancias[f][g] != 9999999 ) {
                    System.out.print(distancias[f][g] + ", ");
                } else {
                    System.out.print("i" + ", ");
                }
            }
            System.out.println();
        }
        
         for (int i = 0; i <=  estrellas.size()-1; i++) {
            for (int j = 0; j <=  estrellas.size()-1; j++) {
                for (int k = 0; k <=  estrellas.size()-1; k++) {
                    if (distancias[i][k] + distancias[k][j] < distancias[i][j]) {
                        distancias[i][j] = distancias[i][k] + distancias[k][j];
                        caminos[i][j] = k;
                    }
                }
            }
        }
        
        for (int f = 0; f <= estrellas.size()-1; f++) {
            for (int g = 0; g <= estrellas.size()-1; g++) {
                if (distancias[f][g] != 0 ) {
                    System.out.print(caminos[f][g] + ", ");
                } else {
                    System.out.print("0" + ", ");
                }
            }
            System.out.println();
        }
       ArrayList<Integer> caristas = new ArrayList();
       ArrayList cam = new ArrayList();
   camino(inicial,fin,caminos,caristas);
   int p=0;
   for(int i=0;i<=caristas.size()-1;i++){
     int star = caristas.get(i);
     for(Arista a: estrellas.get(star).aristas){
         if(a.f == estrellas.get(inicial)){
           p+=a.peso;
           aristasr.add(a);//rojas
           cam.add(estrellas.get(inicial).name+"->");
           inicial=star;
         }
     }
   }
   cam.add(estrellas.get(fin).name);
   String cami="";
   for(int j=0;j<=cam.size()-1;j++){
     cami+=cam.get(j);
   }
   JOptionPane.showMessageDialog(null,"El camino mínimo es: "+cami+ "\nEl peso de este camino mínimo es:"+p+"\n");
   print(caristas.toString());       
}

void camino(int ini, int fin,int caminos[][],ArrayList c){
int h = caminos[ini][fin];
  c.add(h);
if(h!=fin){
 camino(h,fin,caminos,c);
}
}

void reiniciar(){
aristasr.clear();
aristas.clear();
estrellas.clear();
for(int i=0;i<=nombres.size();i++){
star1.removeItem(0);
star2.removeItem(0);
}
nombres.clear();
star1.setEnabled(false);
star2.setEnabled(false);
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
