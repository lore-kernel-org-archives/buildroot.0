From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Jul 2020 19:32:54 +0000
Subject: [Buildroot] [Bug 13071] toolchain not found error when building
 netsurf
In-Reply-To: <bug-13071-163@https.bugs.busybox.net/>
References: <bug-13071-163@https.bugs.busybox.net/>
Message-ID: <bug-13071-163-7b3fTrcgfB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13071

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Could you attach to this bug report the exact Buildroot .config file that
allows to reproduce this issue ?

Indeed, in our autobuilder infrastructure, the build of netsurf hasn't failed
since July 2019.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
