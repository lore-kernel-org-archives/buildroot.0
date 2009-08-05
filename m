From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  5 Aug 2009 10:01:17 +0000 (UTC)
Subject: [Buildroot] [Bug 537] gzip complains about existing function
	futimens from glibc
In-Reply-To: <bug-537-163@https.bugs.busybox.net/>
References: <bug-537-163@https.bugs.busybox.net/>
Message-ID: <20090805100117.B4BC5777D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=537





--- Comment #1 from Will Newton <will.newton@gmail.com>  2009-08-05 10:01:16 UTC ---

This bug should be fixed by this commit:

http://git.buildroot.net/buildroot/commit/?id=27c667c782d90c43fb6148134feb207307674019


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
