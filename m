From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 25 Sep 2007 14:47:59 +0200
Subject: [Buildroot] [Libusb PATCH] for revision 20000
In-Reply-To: <46F87262.20806@gmail.com>
References: <46F87262.20806@gmail.com>
Message-ID: <1190724479.19731.25.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-09-24 klockan 23:28 -0300 skrev Rex Luscus:
> To compile tests must have the libs in stagedir but is impossible to
> copy libs before to compile tests!!!
> Tests are not used and ignored in the package copy. This patch omit this 
> compilation
> (There are not an option in configure file of package to omit this)
> This patch update my yesterday patch
> 

I modified it to SED the LIBUSB/tests/Makefile.in 
which should give the same end result.
libusb now build for ARM.


> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
