From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:44:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libkcapi: fix build on riscv32
In-Reply-To: <20210527204904.480560-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 May 2021 22:49:04 +0200")
References: <20210527204904.480560-1-fontaine.fabrice@gmail.com>
Message-ID: <874ke6kt14.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure on riscv32:
 > lib/internal.h:331:20: error: '__NR_io_getevents' undeclared (first use in this function); did you mean 'io_getevents'?
 >   331 |     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
 >       |                    ^~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c828d4330a8888fe8db4299dc2f20759947f329f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
