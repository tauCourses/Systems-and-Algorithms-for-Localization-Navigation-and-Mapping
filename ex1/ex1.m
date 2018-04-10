M1 = csvread('firstPhone.csv',1,0);
lon1 = M1(:,1);
lat1 = M1(:,2);
utmstruct = defaultm('utm');
utmstruct.zone = '36N';
utmstruct.geoid = wgs84Ellipsoid;
utmstruct = defaultm(utmstruct);
[x1,y1] = mfwdtran(utmstruct, lat1, lon1);
M2 = csvread('secondPhone.csv',1,0);
lon2 = M2(:,1);
lat2 = M2(:,2);
[x2,y2] = mfwdtran(utmstruct,lat2,lon2);
plot(x1,y1,'r.',x2,y2,'b.');
%before next part I've fix the data according to the requierments
zx = x1 - x2;
zx = x1 - x2;
zy = y1 - y2;
eu = sqrt(zx.*zx + zy.*zy);
mean(zx)
std(zx)
mean(zy)
std(zy)
mean(eu)
std(eu)
hist(eu, 50)