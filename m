From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Apr 2020 12:37:08 +0000
Subject: [Buildroot] [Bug 12801] Flag '-Wa,
 --noexecstack' is missing when building uclibc with newer binutils
In-Reply-To: <bug-12801-163@https.bugs.busybox.net/>
References: <bug-12801-163@https.bugs.busybox.net/>
Message-ID: <bug-12801-163-8xjHeFaVBa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12801

romain.naour at gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at uclibc.org       |wbx at openadk.org

--- Comment #4 from romain.naour at gmail.com ---
Hi Marcel,

I'm able to reproduce the issue.

Indeed the error message come from a new as check from binutils 2.31.x series:

https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=67f846b59b32f3d704c601669409c2584383fea9

See similar report and kernel commit:
https://lkml.org/lkml/2018/8/9/233

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=e9666d10a5677a494260d60d1fa0b73cc7646eb3

I'm adding Waldemar in Cc of this bug.

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
