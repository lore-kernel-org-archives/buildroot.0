From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Feb 2012 15:47:10 +0100
Subject: [Buildroot] Question about float-abi
In-Reply-To: <20120229134909.GO23707@ldesroches-Latitude-E6320>
References: <20120228105550.GM23707@ldesroches-Latitude-E6320>
 <20120229110850.GN23707@ldesroches-Latitude-E6320>
 <20120229134909.GO23707@ldesroches-Latitude-E6320>
Message-ID: <20120229154710.7729776d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ludovic,

Le Wed, 29 Feb 2012 14:49:09 +0100,
Ludovic Desroches <ludovic.desroches@atmel.com> a ?crit :

> Yes there were missing options for gcc: --with-float=hard and
> --with-fpu=...
> 
> Now floating score is correct. I am surprised by the good results of
> the uclibc. I don't know if nbench is an accurate benchmark to test
> several libc but scores obtained by glibc, eglibc and uclibc are very
> closed.

As I told you on IRC, those investigations are really interesting. We
know that the Buildroot support for floating-point is far from perfect,
this has been briefly discussed during the last Buildroot Developer
meeting. If you want to improve this part of Buildroot, do not hesitate
to send patches, we are definitely interested.

I guess with internal toolchains, it's quite easy to improve things.
The case of external toolchains is probably a bit more complicated,
since we do not control how the C library of the external toolchain has
been built in terms of floating point support.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
