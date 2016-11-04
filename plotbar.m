function pgr=plotbar(E)
r=0:255;    
bh=E;   
pu=hist(bh,r);    
pgr=pu/length(bh);      