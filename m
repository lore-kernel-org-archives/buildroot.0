From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Aug 2018 22:31:39 +0000
Subject: [Buildroot] [Bug 10996] bogus musl ARM toolchain
In-Reply-To: <bug-10996-163@https.bugs.busybox.net/>
References: <bug-10996-163@https.bugs.busybox.net/>
Message-ID: <bug-10996-163-JQiIGFQbdE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10996

--- Comment #5 from Arnout Vandecappelle <arnout@mind.be> ---
(In reply to Thomas Petazzoni from comment #4)
There is still a bug though... I guess we should make sure that -static is
always passed under BR2_STATIC_LIBS=y.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
