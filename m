From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2009 12:49:15 +0000 (UTC)
Subject: [Buildroot] [Bug 333] Bump sqlite package to 3.6.14
In-Reply-To: <bug-333-163@https.bugs.busybox.net/>
References: <bug-333-163@https.bugs.busybox.net/>
Message-ID: <20090518124915.ADE377786C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=333





--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-05-18 12:49:14 UTC ---
It's required for the standard tarball since there's a version mismatch between
generated scripts and source.
Anyway as pointed by Michael Roth in the mailing list the amalgamation tarball
is the recommended source now and it's not needed for that one.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
