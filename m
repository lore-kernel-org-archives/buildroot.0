From: =?utf-8?Q?Pongr=C3=A1cz_Istv=C3=A1n?= <pongracz.istvan@gmail.com>
Date: Sun, 26 Apr 2015 11:01:09 +0200
Subject: [Buildroot] Kernel panic - unable to mount root fs on
	unknown-block(0, 0) - i486
In-Reply-To: <CAJJ6jxtAFBmUQxA_x6KZb=uBZwr-AZ+kwy=_H0tqG_X79frXmQ@mail.gmail.com>
Message-ID: <6e6358134f05105e61c12ecc5e6bde00@www.startit.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
 
----------------eredeti ?zenet-----------------
Felad?: "Steve Calfee" stevecalfee at gmail.com 
C?mzett: "Pongr?cz Istv?n" 
CC: "Yann E. MORIN" yann.morin.1998 at free.fr , "buildroot busybox.net" buildroot at busybox.net 
D?tum: Sat, 25 Apr 2015 15:18:28 -0700
-------------------------------------------------
 
 
> 
> So then I did a little binary searching and found kernels up to 3.16.7
> boot properly, but 3.17 does not. So it looks like the uboot/kernel
> environment broke starting at 3.17. I get no messages after uboot
> starts the kernel. Does anyone know what to try next?
>


Hi Steve,

Thank you very much for your response. Now I compile kernel 3.16 to see, what happens. 
Everything else are unchanged.

The other test will be, I will compile 3.18 outside of buildroot, into standard deb package, including initrd, without changing the kernel config. 

Bye,
Istv?n
