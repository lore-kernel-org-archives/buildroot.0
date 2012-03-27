From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 27 Mar 2012 02:18:06 +0200
Subject: [Buildroot] older/newer pthread ,
	curl segmentation fault and libupnp segmentation fault NTPL ok for
	both
In-Reply-To: <CBC3D1F8BC6646D3936D6D004F84ED85@JohanW7>
References: <CBC3D1F8BC6646D3936D6D004F84ED85@JohanW7>
Message-ID: <09E4FCDFAE2842BDAA9553D1181CC13C@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

In addition i tested NTPL, this works for both.

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Sagaert Johan
Verzonden: zondag 25 maart 2012 21:39
Aan: buildroot at busybox.net
Onderwerp: [Buildroot] older/newer pthread ,curl segmentation fault and libupnp segmentation fault

 
>Hi
 
>Did some experimental builds :
 
>uClibc 0.9.33
 
 
>older style pthreads                            		newer style pthread
>====================                            		===================
 
>libupnp : ok						 		libupnp : segmentaation fault

>curl : segmenation fault				 		curl	: ok
>(curl does not segfault if openssl is left out)


>There may be more packages sensitive to the pthread style selected.

>Who to blame for the segfaults, is it the underlying uClibc throwing the segfault or is it in the apps..?

>Regards Johan
