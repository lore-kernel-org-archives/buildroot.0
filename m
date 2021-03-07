From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 07 Mar 2021 18:02:42 +0000
Subject: [Buildroot] [Bug 13576] Issues compiling buildroot for 5x86
In-Reply-To: <bug-13576-163@https.bugs.busybox.net/>
References: <bug-13576-163@https.bugs.busybox.net/>
Message-ID: <bug-13576-163-oYt8BpqcJS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13576

--- Comment #7 from Peter Seiderer <ps.report@gmx.net> ---
Regarding Description - Point 3) - syslinux double definitions

Fixed (hopefully) by:

https://patchwork.ozlabs.org/project/buildroot/patch/20210307174753.9400-1-ps.report at gmx.net/

Out of interest, any references for the grub statement?


Regarding Description - Point 1) - MariaDB

No problem building your provided defconfig here, did you do a full
rebuild after changing your config (see [1] for details)?

In case a full rebuild fails, any special packages installed on your build
system?

[1] http://nightly.buildroot.org/manual.html#full-rebuild

-- 
You are receiving this mail because:
You are on the CC list for the bug.
