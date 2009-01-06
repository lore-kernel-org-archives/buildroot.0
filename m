From: Daniel Ng <daniel_ng11@lycos.com>
Date: Tue, 6 Jan 2009 22:53:33 +0000 (UTC)
Subject: [Buildroot] Which u-boot/buildroot version for ppc8272?
References: <loom.20090106T043218-43@post.gmane.org>
	<87ljtovpem.fsf@macbook.be.48ers.dk>
Message-ID: <loom.20090106T224840-114@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@...> writes:
> Yes, u-boot recently broke. I fixed it up yesterday and it builds for
> me for a 603e (83xx).
> 

Hi Peter,

I've just tried the latest (buildroot-20090106.tar.bz2) but get the same error-

make[1]: Entering directory 
`/home/dng/buildroot/project_build_powerpc/uclibc/u-boot-2009.01-rc1'
make[1]: *** No rule to make target `_config'.  Stop.
make[1]: Leaving directory `/home/dng/buildroot/project_build_powerpc/uclibc/u-
boot-2009.01-rc1'
make: *** [/home/dng/buildroot/project_build_powerpc/uclibc/u-boot-2009.01-
rc1/.configured] Error 2

In 'make menuconfig', all I did was:

1) Specify PowerPC 603e
2) Select u-boot

-everything else was left as their defaults.

Perhaps I need to change another menuconfig setting?

Also, did you try it by downloading buildroot-20090106.tar.bz2? Or did you try 
it using some other bz2 file?

Cheers,
Daniel
