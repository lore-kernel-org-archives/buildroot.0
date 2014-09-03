From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Sep 2014 18:02:48 +0000 (UTC)
Subject: [Buildroot] [Bug 7364] monit doesn't start with glibc 2.19 because
 geteuid() fails
In-Reply-To: <bug-7364-163@https.bugs.busybox.net/>
References: <bug-7364-163@https.bugs.busybox.net/>
Message-ID: <20140903180248.A58079D5E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7364

--- Comment #1 from syntheticpp at gmx.net 2014-09-03 18:02:48 UTC ---
Logging in via ssh is delayed, looks like it runs into a timeout.
(strace shows that a select() on the client IP is paused)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
