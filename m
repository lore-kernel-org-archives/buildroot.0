From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 May 2014 23:39:45 +0200
Subject: [Buildroot] [PATCH] lsof: don't use host toolchain to determine
	target libc
In-Reply-To: <106644d5ef8b1b8a9cfeba005079957f63702757.1400071508.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 14 May 2014 15:45:08 +0300")
References: <106644d5ef8b1b8a9cfeba005079957f63702757.1400071508.git.baruch@tkos.co.il>
Message-ID: <87iop6sov2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The lsof Configure script builds a test program using the host toolchain to
 > test whether glibc is used. This test is broken in cross compilation
 > environment. Set LINUX_CLIB to avoid the test. This should give the correct
 > result even for non glibc toolchains, since all libc variants we support have
 > the netinet/tcp.h header.

 > Fixes:
 > http://autobuild.buildroot.net/results/a1f/a1f0572dbf968c21f70b35cefff7ef7a1d9a348a/

 > Cc: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
