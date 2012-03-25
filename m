From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 25 Mar 2012 21:38:55 +0200
Subject: [Buildroot] older/newer pthread ,
	curl segmentation fault and libupnp segmentation fault
Message-ID: <CBC3D1F8BC6646D3936D6D004F84ED85@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi
 
Did some experimental builds :
 
uClibc 0.9.33
 
 
older style pthreads                            		newer style pthread
====================                            		===================
 
libupnp : ok						 		libupnp : segmentaation fault

curl : segmenation fault				 		curl	: ok
(curl does not segfault if openssl is left out)


There may be more packages sensitive to the pthread style selected.

Who to blame for the segfaults, is it the underlying uClibc throwing the segfault or is it in the apps..?

Regards Johan
