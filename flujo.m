A=load("in_print_flujo_225p_v4_door1.2.txt");

I = find(A(:,1)==0.65 & A(:,2)==0.65);


for i=length(I):-1:1,
	A(I(i):I(i)+22499,:)=[];
end

minimo=0;
maximo=20;
delta=21;
[n,m] = size(A);
x=A(:,1);
y=A(:,2);
vx=A(:,3);
vy=A(:,4);


celda_x=linspace(minimo,maximo,delta);
celda_y=linspace(minimo,maximo,delta);


Mvx=zeros(delta);
Mvy=zeros(delta);
N=ones(delta);

for i=1:length(x),
  if x(i)<maximo,
          %j=ceil(x(i));
          %k=ceil(y(i));
	 j=ceil(((x(i)-minimo)/(maximo-minimo))*(delta-1));
	 k=ceil(((y(i)-minimo)/(maximo-minimo))*(delta-1));
	 Mvx(k,j)=Mvx(k,j)+vx(i);
	 Mvy(k,j)=Mvy(k,j)+vy(i);
	 N(k,j)=N(k,j)+1;
  end
end

Mvx=Mvx./N;
Mvy=Mvy./N;



figure
quiver(celda_x,celda_y,Mvx,Mvy)
streamline(celda_x,celda_y,Mvx,Mvy)


% saving variables
save out_print_flujo_225p_v4_door1_2.txt Mvx Mvy N 



