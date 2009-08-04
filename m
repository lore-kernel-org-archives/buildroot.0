From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  4 Aug 2009 08:07:51 +0000 (UTC)
Subject: [Buildroot] [Bug 325] New package ratpoison
In-Reply-To: <bug-325-163@https.bugs.busybox.net/>
References: <bug-325-163@https.bugs.busybox.net/>
Message-ID: <20090804080752.1547A7779C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=325





--- Comment #3 from Jim Persson <spambox@nurd.se>  2009-08-04 08:07:50 UTC ---
Yes, without them ratpoison segfaults when starting as it is trying to load
some fonts. But they are not needed during the build.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
