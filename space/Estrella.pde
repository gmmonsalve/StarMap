class Estrella{
  
PImage star;
String name;
int num;
int x1,y1,x2,y2;
ArrayList<Arista> aristas = new ArrayList();

Estrella(PImage st,String nom){
this.star = st;
this.name=nom;

}

public void name(String n){
this.name = n;

}
public void setX1(int n){
  this.x1=n;
  this.x2=n+50;
}

public void setY1(int n){
  this.y1=n;
  this.y2=n+50;
}

}