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
// set weight w bet 0 and 1
w=.9
// est vector is dest
dest=zeros(1, mp);

// set pmm and pmp matrices
pmm=eye(nfilter,nfilter) ;
pmp=eye(nfilter,nfilter) ;


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

emm = zeros (1,nfilter) ;
emp= zeros(1,nfilter) ;
// begin computation for i statement
for i=1: mp-nfilter ;
i ;
xmm = x(1:1, i: (nfilter+i -1) ) ;
in= i+1 ;

// set next input vector
xmp = x(1:1, in: (nfilter+in -1) ) ;

// compute thedhat value from xmm ' *hmm
// dhat is set to zero vector first

dhat = xmm*hmm' ;
// udate est vector
dest(i) = dhat ;
// compute last error
elast= d(i) - dhat ;
elast ;
// compute error vector emm
emm = d(1: 1 , i: (nfilter+i -1) ) -dest(1:1 , i: (nfilter+i -1) ) ;

// compute kalman gain
kmg = w + xmm*pmm*xmm' ;

// compute kalman gain vector
kalgv =pmm*xmm' /kmg ;

// update pmm
pm = kalgv*xmm*pmm ;
pmp= pmm-pm ;
pmm = pmp*(1/w) ;


// update hmm vector
hmp= hmm + kalgv'*elast ;
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
