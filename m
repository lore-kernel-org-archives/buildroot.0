From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Jun 2014 22:55:49 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140615225549.791CF9CC76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-06-15 22:55:49 UTC ---
Thanks a lot for the debugging! I'll have a closer look and see what is the
appropriate solution to make sure that C++ exceptions work with glibc, and that
we can still enable musl.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
