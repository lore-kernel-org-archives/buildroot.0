From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2020 07:37:15 +0000
Subject: [Buildroot] [Bug 12521] RISCV RV32IA selected, RV64GC output
In-Reply-To: <bug-12521-163@https.bugs.busybox.net/>
References: <bug-12521-163@https.bugs.busybox.net/>
Message-ID: <bug-12521-163-JIJQ6tuxMz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12521

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |INVALID

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
We still don't have any way of reproducing the issue, and both Mark and I
believe there is in fact no issue: whether the kernel is 64 bit or 32 bit is
not directly Buildroot's fault: it is up to having a correct Linux kernel
configuration.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
