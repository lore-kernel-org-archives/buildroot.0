From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Nov 2010 16:10:06 +0000 (UTC)
Subject: [Buildroot] [Bug 2767] Build for lsof broken in buildroot-2010.08
In-Reply-To: <bug-2767-163@https.bugs.busybox.net/>
References: <bug-2767-163@https.bugs.busybox.net/>
Message-ID: <20101104161006.9E1D88178D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2767

--- Comment #4 from Andy Gibbs <andyg1001@hotmail.co.uk>  ---
(In reply to comment #3)
> Now when make is invoked, buildroot's CFLAGS are passed via DEBUG:
> [ snip ]

Sorry, I should probably just point out that this is the original behaviour for
building the package, not something that I've changed in my patch.  Perhaps
this problem is the reason why the original package worked this way?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
