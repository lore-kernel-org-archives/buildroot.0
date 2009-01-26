From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Jan 2009 23:08:54 +0000 (UTC)
Subject: [Buildroot] [Bug 69] tar refuses to build
In-Reply-To: <bug-69-163@https.bugs.busybox.net/>
References: <bug-69-163@https.bugs.busybox.net/>
Message-ID: <20090126230854.9E3A677459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=69





--- Comment #4 from Jan Kretschmer <kretschi@online.de>  2009-01-26 23:08:52 UTC ---
The Gnu Tar is included by the "generic development system"-target. So it is
marked as a dependency, if you choose the generic development system, isn't it?
I never activated the gnu-tar to be build explicitly, so I never thought about
alternatives ;)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
