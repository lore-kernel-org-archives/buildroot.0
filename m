From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Mar 2012 22:16:17 +0000 (UTC)
Subject: [Buildroot] [Bug 4958] Qt 4.7.4 build crashes with Linux 2.6.29
In-Reply-To: <bug-4958-163@https.bugs.busybox.net/>
References: <bug-4958-163@https.bugs.busybox.net/>
Message-ID: <20120321221617.95F7E96926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4958

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> 2012-03-21 22:16:17 UTC ---
(In reply to comment #3)

Do notice that just using new kernel headers is not enough if your kernel
doesn't handle sys_accept4. Qt is also not the only program using accep4, udev
is a another well known one.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
