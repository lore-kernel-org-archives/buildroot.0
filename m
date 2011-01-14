From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Jan 2011 22:09:10 +0000 (UTC)
Subject: [Buildroot] [Bug 3007] kexec doesn't build: Missing regdef.h file
In-Reply-To: <bug-3007-163@https.bugs.busybox.net/>
References: <bug-3007-163@https.bugs.busybox.net/>
Message-ID: <20110114220910.25BC08B528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3007

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
Fixed by kexec version bump in git, thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
