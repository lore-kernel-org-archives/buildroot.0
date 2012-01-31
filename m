From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Jan 2012 19:43:30 +0000 (UTC)
Subject: [Buildroot] [Bug 4718] python (built for powerpc) distutils has
 paths to host compiler toolchain
In-Reply-To: <bug-4718-163@https.bugs.busybox.net/>
References: <bug-4718-163@https.bugs.busybox.net/>
Message-ID: <20120131194330.E346690962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4718

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-01-31 19:43:30 UTC ---
Python support for cross-compilation is quite horrible, so the problem may be
quite hard to fix.

Could you give some steps to reproduce what you are seeing?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
