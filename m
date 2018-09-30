From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 20:41:13 +0200
Subject: [Buildroot] [PATCH-2018.02.x] glibc: bump to latest on 2.26.x
 branch for additional fixes
In-Reply-To: <20180927113542.21230-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 27 Sep 2018 13:35:42 +0200")
References: <20180927113542.21230-1-peter@korsgaard.com>
Message-ID: <87efda25h2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Daniel Alvarez (1):
 >       getifaddrs: Don't return ifa entries with NULL names [BZ #21812]

 > Florian Weimer (8):
 >       libio: Avoid _allocate_buffer, _free_buffer function pointers [BZ #23236]
 >       Use _STRUCT_TIMESPEC as guard in <bits/types/struct_timespec.h> [BZ #23349]
 >       libio: Disable vtable validation in case of interposition [BZ #23313]
 >       NEWS: Reorder out-of-order bugs
 >       Synchronize support/ infrastructure with master
 >       libio: Add tst-vtables, tst-vtables-interposed
 >       stdio-common/tst-printf.c: Remove part under a non-free license [BZ #23363]
 >       conform/conformtest.pl: Escape literal braces in regular expressions

 > Gabriel F. T. Gomes (1):
 >       Fix parameter type in C++ version of iseqsig (bug 23171)

 > H.J. Lu (2):
 >       x86: Correct index_cpu_LZCNT [BZ #23456]
 >       x86: Populate COMMON_CPUID_INDEX_80000001 for Intel CPUs [BZ #23459]

 > Martin Kuchta (1):
 >       pthread_cond_broadcast: Fix waiters-after-spinning case [BZ #23538]

 > Stefan Liebler (1):
 >       Fix segfault in maybe_script_execute.

 > Steve Ellcey (1):
 >       Check length of ifname before copying it into to ifreq structure.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
