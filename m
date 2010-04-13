From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Apr 2010 16:13:48 +0000 (UTC)
Subject: [Buildroot] [Bug 1213] Move .config into output directory
In-Reply-To: <bug-1213-163@https.bugs.busybox.net/>
References: <bug-1213-163@https.bugs.busybox.net/>
Message-ID: <20100413161348.F36478DE32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1213





--- Comment #8 from Nick Leverton <nick@leverton.org>  2010-04-13 16:13:48 UTC ---
That's good, works fine !  Although there was an error in applying it against
BR2010.02 - it looks as if it might have been generated against an already
part-patched source.  I'm attaching a version with the extra lines removed,
which applied with just a few offsets.  Would you have a look at it for me
please ?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
