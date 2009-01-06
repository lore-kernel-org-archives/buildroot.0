From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 08:56:17 +0100
Subject: [Buildroot] Which u-boot/buildroot version for ppc8272?
In-Reply-To: <loom.20090106T043218-43@post.gmane.org> (Daniel Ng's message of
	"Tue\, 6 Jan 2009 04\:33\:45 +0000 \(UTC\)")
References: <loom.20090106T043218-43@post.gmane.org>
Message-ID: <87ljtovpem.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Ng <daniel_ng11@lycos.com> writes:

 Daniel> Hi,
 Daniel> Which daily snapshot version of buildroot would people recommend for a PPC 
 Daniel> 8272-based (603e core) board?

The latest.

 Daniel> I just tried yesterday's (buildroot-20090105.tar.tar) buildroot snapshot and 
 Daniel> it failed to build-

 Daniel> make[1]: *** No rule to make target `_config'.  Stop.
 Daniel> make[1]: Leaving directory 
 Daniel> `/home/dng/buildroot2009/buildroot/project_build_powerpc/uclibc/u-boot-2009.01-
 Daniel> rc1'
 Daniel> make: *** [/home/dng/buildroot2009/buildroot/project_build_powerpc/uclibc/u-
 Daniel> boot-2009.01-rc1/.configured] Error 2

Yes, u-boot recently broke. I fixed it up yesterday and it builds for
me for a 603e (83xx).

-- 
Bye, Peter Korsgaard
