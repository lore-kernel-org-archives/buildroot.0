From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 May 2010 22:04:17 +0200
Subject: [Buildroot] [PATCH v2] atngw100_defconfig: update to fix build
	failure
In-Reply-To: <1274373293-7002-1-git-send-email-bjorn.forsman@gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Thu,
	20 May 2010 18:34:53 +0200")
References: <1274373293-7002-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <87fx1jr9dq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 Bj?rn> atngw100_defconfig: update to fix build failure:
 Bj?rn>   * The AVR32 toolchain fails to build with the new uClibc version
 Bj?rn>     0.9.31.x. Use the older uClibc 0.9.30.x branch instead.
 Bj?rn>   * Disable linux-fusion as it fails to build
 Bj?rn>     (why was this selected anyway, when DirectFB was not selected?).
 Bj?rn>   * U-Boot 2010.03 is broken for AVR32. The build fails with:
 Bj?rn>       zlib.c:31:27: error: asm/unaligned.h: No such file or directory
 Bj?rn>     Select the older U-Boot 2009.08 version that builds instead.
 Bj?rn>   * Disable rsync as it fails to build.

Committed, thanks!

-- 
Bye, Peter Korsgaard
