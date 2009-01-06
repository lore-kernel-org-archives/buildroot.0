From: Daniel Ng <daniel_ng11@lycos.com>
Date: Tue, 6 Jan 2009 04:33:45 +0000 (UTC)
Subject: [Buildroot] Which u-boot/buildroot version for ppc8272?
Message-ID: <loom.20090106T043218-43@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Which daily snapshot version of buildroot would people recommend for a PPC 
8272-based (603e core) board?

I just tried yesterday's (buildroot-20090105.tar.tar) buildroot snapshot and 
it failed to build-

make[1]: *** No rule to make target `_config'.  Stop.
make[1]: Leaving directory 
`/home/dng/buildroot2009/buildroot/project_build_powerpc/uclibc/u-boot-2009.01-
rc1'
make: *** [/home/dng/buildroot2009/buildroot/project_build_powerpc/uclibc/u-
boot-2009.01-rc1/.configured] Error 2

Cheers,
Daniel
