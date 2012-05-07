From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 May 2012 12:30:17 +0000 (UTC)
Subject: [Buildroot] [Bug 4928] internal compiler error in varasm.c
In-Reply-To: <bug-4928-163@https.bugs.busybox.net/>
References: <bug-4928-163@https.bugs.busybox.net/>
Message-ID: <20120507123017.C939396C59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4928

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2012-05-07 12:30:17 UTC ---
Did you try with another gcc version?
I wouldn't prioritize this as blocker though, since it's an upstream bug rather
than a buildroot one.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
