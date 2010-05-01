From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 May 2010 18:59:15 +0000 (UTC)
Subject: [Buildroot] [Bug 1321] Busybox link fails due to lack of --sysroot
	option
In-Reply-To: <bug-1321-163@https.bugs.busybox.net/>
References: <bug-1321-163@https.bugs.busybox.net/>
Message-ID: <20100501185915.74E238F533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1321

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org>  ---
Committed, thanks - Notice that the patch didn't apply to current git, I think
you must have some local changes.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
