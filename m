From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Jul 2016 19:14:35 +0000
Subject: [Buildroot] [Bug 9016] arceb-buildroot-linux-uclibc ld uses
 incorrect default format
In-Reply-To: <bug-9016-163@https.bugs.busybox.net/>
References: <bug-9016-163@https.bugs.busybox.net/>
Message-ID: <bug-9016-163-F0Unlo8ZHx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9016

--- Comment #1 from Vlad Zakharov <Vladislav.Zakharov@synopsys.com> ---
Hi, 

I built toolchain in buildroot, tried to run your examples and got the
following results:
--------------------->8-------------------
.../arceb-buildroot-linux-uclibc/bin/ld --print-output-format
elf32-bigarc
--------------------->8-------------------

Please provide more about conditions under which the failure occurred, e.g.
what toochain version and git revision were used.
That would help us to catch and fix the issue.

Thanks,
Vlad.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
