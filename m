From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Jul 2009 19:43:43 +0000 (UTC)
Subject: [Buildroot] [Bug 325] New package ratpoison
In-Reply-To: <bug-325-163@https.bugs.busybox.net/>
References: <bug-325-163@https.bugs.busybox.net/>
Message-ID: <20090726194343.D149277790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=325


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-26 19:43:43 UTC ---
hmm, you select fontconfig + liberation, but you don't depend on them being
available before building in the makefile - Are they not hard dependencies?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
