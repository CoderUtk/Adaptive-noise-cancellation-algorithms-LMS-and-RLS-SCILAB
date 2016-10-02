// set len of signal mp
mp=500
// set time vector n
n=(1:1:mp ) ;
// set len of filter hmm and hmp
nfilter =20 ;
// set noise vector
R= .2 // variance Gaussian
av =0 // mean Gaussian
sd =sqrt(R) // std Gaussian



v = grand(1,mp,'nor',av,sd) ;// generate white gaussian
hmm = zeros(1,nfilter) ;
hmp = zeros(1,nfilter) ;

// est vector is dest
dest=zeros(1, mp);




// create input signal x in theta
dtheta =2*%pi/mp ;
x=dtheta*n ;
// create desired vector d as sin(x)
d =sin(x) ;
figure(0) ;
plot (x ,d) ;
// set xmm init vector
i=1 ;
x1=x; // we are using x as d + noise so we store x as x1
// now create input vector x with noise

x= d+v ;
deltn =.01 // step size
// begin computation for i statement
for i=1: mp-nfilter ;
i ;
xmm = x(1:1, i: (nfilter+i -1) ) ;
in= i+1 ;

// set next input vector
//xmp = x(1:1, in: (nfilter+in -1) ) ;

// compute thedhat value from xmm ' *hmm
// dhat is set to zero vector first

dhat = xmm*hmm' ;
// update est vector
dest(i) = dhat ;
// compute last error
elast= d(i) - dhat ;
elast ;
// update hmm vector
hmp= hmm + xmm*elast*deltn ;
hmm =hmp ;
// next step
end ;
d ;
dest ;
figure(1);



subplot(221) ;
title (' true signal ');
plot(x1, d);
subplot(222) ;
title (' signal + noise ');
plot(x1, x);
subplot(224)
title (' filtered signal ');
plot(x1, dest);
subplot(223)
title (' noise ');
plot(x1, v);
