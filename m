From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Jul 2009 20:20:29 +0000 (UTC)
Subject: [Buildroot] [Bug 455] Fontconfig problem problem when
	building/installing
In-Reply-To: <bug-455-163@https.bugs.busybox.net/>
References: <bug-455-163@https.bugs.busybox.net/>
Message-ID: <20090713202029.8B05977800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=455


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-13 20:20:29 UTC ---
Hmm, please make the patch as minimal as possible - E.G. the fix-makealias
patch has a bunch of noise because it removes trailing spaces.

I don't get what the problem is as the Makefile calls sh and not $PREFIX/bin/sh
- Is it because you have a sh for the target in $STAGING_DIR/bin and that
included in the path?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
