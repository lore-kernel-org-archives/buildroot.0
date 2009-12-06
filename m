From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  6 Dec 2009 17:42:46 +0000 (UTC)
Subject: [Buildroot] [Bug 765] Add buildroot branding to gcc
In-Reply-To: <bug-765-163@https.bugs.busybox.net/>
References: <bug-765-163@https.bugs.busybox.net/>
Message-ID: <20091206174246.60F2177727@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=765


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-12-06 17:42:44 UTC ---
Committed, thanks. I've changed it slightly to check for !4.2.x instead so we
don't need to update it once we add 4.5.x and further.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
