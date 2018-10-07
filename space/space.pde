import g4p_controls.*;
import javax.swing.JOptionPane;
//atributos
ArrayList<Estrella> estrellas = new ArrayList();//conjunto de estrellas
ArrayList<PImage> im = new ArrayList(); //imágenes de las estrellas
ArrayList<Arista> aristas = new ArrayList();
int n=0,tam=0; //variable de control para las imágenes 
PImage back,ga; //fondo
ArrayList<String> nombres = new ArrayList();

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
  JOptionPane.showMessageDialog(null,"Bienvenido, haga click en la pantalla para agregar estrellas al mapa");
}

public void draw(){
image(back,0,0,900,600);
  for(Arista a: aristas){
    stroke(255);
    int x1=a.x1+25,y1=a.y1+25,x2=a.x2+25,y2=a.y2+25;
    line(x1,y1,x2,y2);
    String w = ""+a.peso;
    text(w,((x1+x2)/2)-10,((y1+y2)/2)-10);
  }
  for(Estrella e: estrellas){
      image(e.star,e.x1,e.y1,50,50);
      text(e.name,e.x1,e.y1+60);
  }
}

void mousePressed(){
  if(mousePressed==true && mouseButton==RIGHT){
    int x=mouseX,y=mouseY;
    String name = JOptionPane.showInputDialog(null,"Escriba el nombre de la estrella a insertar");
    if(name!=null){
    Estrella nueva = new Estrella(im.get(n),name); 
    if(n==7){
     n=0;
    }else{
     n+=1;
    }
    nueva.x1=x;
    nueva.y1=y;
    estrellas.add(nueva);
    nombres.add(nueva.name);
    star1.setItems(nombres,0);
    star2.setItems(nombres,0);
    }else{
      JOptionPane.showMessageDialog(null,"Por favor ingrese un nombre válido.");
    }
  }
}

void floydWar(){
int distancias[][] = new int[estrellas.size()][estrellas.size()];
for(int i=0;i<=estrellas.size();i++){
for(int j=0;j<=estrellas.size();j++){
  
}
}

for(int i=0;i<=estrellas.size();i++){
  for(int j=0;i<=estrellas.size();i++){
    
  }
}

}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}