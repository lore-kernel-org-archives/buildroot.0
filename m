From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 23 Feb 2013 17:17:00 +0000 (UTC)
Subject: [Buildroot] [Bug 5960] fusion.ko driver does not install to target
	rootfs
In-Reply-To: <bug-5960-163@https.bugs.busybox.net/>
References: <bug-5960-163@https.bugs.busybox.net/>
Message-ID: <20130223171700.3A7239A874@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5960

--- Comment #4 from Arnout Vandecappelle <arnout@mind.be> 2013-02-23 17:17:22 UTC ---
It's a bug in linux-fusion's Makefile: it thinks that you're compiling against
linux 2.4.x.

It's been fixed in linux-fusion 9.0.0.

I'll send a version bump patch - can you test if it works in your setup?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
