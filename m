From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2009 07:43:29 +0000 (UTC)
Subject: [Buildroot] [Bug 333] Bump sqlite package to 3.6.14
In-Reply-To: <bug-333-163@https.bugs.busybox.net/>
References: <bug-333-163@https.bugs.busybox.net/>
Message-ID: <20090518074329.A9B587780F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=333





--- Comment #1 from Sven Neumann <s.neumann@raumfeld.com>  2009-05-18 07:43:29 UTC ---
+SQLITE_AUTORECONF = YES

Is this change necessary for the new version? IMO autoreconf should be avoided
if possible.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
