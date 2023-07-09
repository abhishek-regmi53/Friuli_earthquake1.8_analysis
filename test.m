fid=fopen('Friuli_1.80000.CSV');
c=textscan(fid,'%f %f %f %f %f %f %f %f %f','Delimiter',',','headerlines',14);
c=cell2mat(c);
figure(1)
plot((c(:,7))/4);
hold on;
plot([0,30000],[0,0]);

