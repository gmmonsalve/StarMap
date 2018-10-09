class Arista{
int x1;
int x2;
int y1;
int y2;
int peso;
Estrella i;
Estrella f;

Arista(Estrella ini, Estrella fin, int p){
  this.i=ini;
  this.f=fin;
  this.x1=ini.x1+25;
  this.y1=ini.y1+25;
  this.x2=fin.x1+25;
  this.y2=fin.y1+25;
  this.peso = p;
}

}