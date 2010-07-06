From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Jul 2010 12:23:46 +0000 (UTC)
Subject: [Buildroot] [Bug 2143] buildroot compiler generates segfaulting
 statically linked executables
In-Reply-To: <bug-2143-163@https.bugs.busybox.net/>
References: <bug-2143-163@https.bugs.busybox.net/>
Message-ID: <20100706122346.B833D8257D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2143

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
It's a GCC issues (BR32219) that gets triggered by uClibc 0.9.31. It has been
worked around in uClibc since the release, and I have now integrated those
fixes in git (e09aa6049323)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
