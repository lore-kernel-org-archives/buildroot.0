From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Jan 2018 09:52:35 +0000
Subject: [Buildroot] [Bug 10551] PowerPC SPE and Musl
In-Reply-To: <bug-10551-163@https.bugs.busybox.net/>
References: <bug-10551-163@https.bugs.busybox.net/>
Message-ID: <bug-10551-163-U75GWQDueV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10551

--- Comment #4 from sigurd.segtnan at kongsberg.com ---
We have tested the patch on Power PC with and without SPE, and it works in both
caes. In view of the original line 74 of buildroot/Config.in ("depens on
!BR2_powerpc_SPE # not supported, build breaks") I suggest that we keep that
patch as is-ish.

The -ish part is the change to Config.in. Instead of commenting out the line, a
link to this discussion might be useful, so that anybody else that have a Power
PC + musl issue can find it.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
