clear all
close all
str = input('input file name\n','s');
f = fopen(str,'r');
dump = fgets(f);
A = zeros(5,5)-1e20;
for i = 1:5
    temp =  str2num(fgets(f));
    A(i,:) = deal(temp);
end
dump = fgets(f);
B = zeros(5,1)-1e20;
K = A;
for i = 1:2
    temp = str2num(fgets(f));
    B(temp(1)) = temp(2);
    K(temp(1)-(i-1),:) = [];
    K(:,temp(1)-(i-1)) = [];
end
dump = fgets(f);
C = zeros(3,1)-1e20;
for i = 1:3
    temp = str2num(fgets(f));
    C(i) = temp(2);
end
D = inv(K)*C;
F = [ 0;D(1);D(2);D(3);0];
str2 = input('Output File name\n','s');
fo = fopen(str2,'w');
fprintf(fo,'Displacement Matrix \n');
fprintf(fo,'%.3f \n',F(1:end));
fclose(fo);
fclose(f);
    