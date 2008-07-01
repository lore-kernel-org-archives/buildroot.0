From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jul 2008 23:50:56 +0200
Subject: [Buildroot] libc build fails.
In-Reply-To: <1214946049.30879.5.camel@elrond.atmel.sweden> (Ulf Samuelsson's
	message of "Tue\, 01 Jul 2008 23\:00\:49 +0200")
References: <1214946049.30879.5.camel@elrond.atmel.sweden>
Message-ID: <87od5htgsf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf@atmel.com> writes:

Hi,

 Ulf> Trying to compile gcc-4.3.1 for ARM (OABI) using uClibc 0.9.29.
 Ulf> During the build of libc.a, it crashes with the following error message:

 Ulf> <snip>
 Ulf> CC libc/sysdeps/linux/common/chdir.os
 Ulf> In file included from ./include/sys/param.h:22,
 Ulf>                  from libc/sysdeps/linux/common/chdir.c:13:
 Ulf> ./include/limits.h:124:26: error: limits.h: No such file or directory

Yes, that was reported a week or 2 ago. Bernhard is afaik looking into
it.

That's also why 4.2.4 is still the default compiler.

-- 
Bye, Peter Korsgaard
