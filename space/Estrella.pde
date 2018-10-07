class Estrella{
  
PImage star;
String name;
int x1,y1,x2,y2;
ArrayList<Estrella> relaciones = new ArrayList();

Estrella(PImage st,String nom){
this.star = st;
this.name=nom;

}

public void name(String n){
this.name = n;

}
public void setX1(int n){
  this.x1=n;
}

public void setY1(int n){
  this.y1=n;
}
public void setX2(int n){
  this.x2=n;
}

public void setY2(int n){
  this.y2=n;
}

}