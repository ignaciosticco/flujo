load out_print_flujo_225p_v4_door1_2.txt

minimo=0;
maximo=20;
delta=21;
celda_x=linspace(minimo,maximo,delta);
celda_y=linspace(minimo,maximo,delta);



figure

quiver(celda_x,celda_y,Mvx,Mvy)
axis([11 21 1 18])
xlabel('Position x (m)') % x-axis label
ylabel('Position y (m)') % y-axis label
streamline(celda_x,celda_y,Mvx,Mvy)



