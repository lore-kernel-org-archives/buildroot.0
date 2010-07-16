From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Jul 2010 21:58:28 +0000 (UTC)
Subject: [Buildroot] [Bug 2221] Qt does not compile (dependencies not taken
 into account?)
In-Reply-To: <bug-2221-163@https.bugs.busybox.net/>
References: <bug-2221-163@https.bugs.busybox.net/>
Message-ID: <20100716215828.6F04582A80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2221

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
Fixed in git, thanks!

The QT_DEP_LIBS is correct because of the way we build stuff in BR (single
threaded toplevel make).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
