From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 15:08:50 +0200
Subject: [Buildroot] [PATCH] glibc: bump version for post-2.28 fixes
In-Reply-To: <20180927130713.15364-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 27 Sep 2018 15:07:13 +0200")
References: <20180927130713.15364-1-peter@korsgaard.com>
Message-ID: <875zyp7orh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Carlos O'Donell (1):
 >       Fix tst-setcontext9 for optimized small stacks.

 > DJ Delorie (3):
 >       RISC-V: Fix rounding save/restore bug.
 >       Regen RISC-V rvd ULPs
 >       Improve ChangeLog message.

 > Florian Weimer (6):
 >       Linux: Rewrite __old_getdents64 [BZ #23497]
 >       error, error_at_line: Add missing va_end calls
 >       nscd: Deallocate existing user names in file parser
 >       nss_files: Fix file stream leak in aliases lookup [BZ #23521]
 >       regex: Add test tst-regcomp-truncated [BZ #23578]
 >       misc: New test misc/tst-gethostid

 > H.J. Lu (1):
 >       i386: Use ENTRY and END in start.S [BZ #23606]

 > Martin Kuchta (1):
 >       pthread_cond_broadcast: Fix waiters-after-spinning case [BZ #23538]

 > Mingli Yu (1):
 >       Linux gethostid: Check for NULL value from gethostbyname_r [BZ #23679]

 > Paul Eggert (1):
 >       regex: fix uninitialized memory access

 > Samuel Thibault (2):
 >       hurd: Add missing symbols for proper libc_get/setspecific
 >       hurd: Avoid PLTs for __pthread_get/setspecific

 > Stefan Liebler (1):
 >       Fix segfault in maybe_script_execute.

 > Wilco Dijkstra (1):
 >       Fix strstr bug with huge needles (bug 23637)

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
