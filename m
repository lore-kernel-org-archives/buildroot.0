From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 22 Dec 2010 22:47:17 -0600
Subject: [Buildroot] oprofile "requires" gmp???
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot v2011.02-git Configuration:

MIPS-32r2 using native toolchain, uclibc-0.9.31.x, gcc-4.5.x, binutils
2.20.1.

When I select oprofile from packages -> debug utils, gmp is selected,
though the .config file reports # BR2_PACKAGE_LIBGMP is not set, though
buildroot attempts to build it.

There are no dependencies for gmp listed in the oprofile help section.

What gives?

Should I file this as a bug report?

Thanks,
Andy
