From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 12 May 2011 13:07:49 +0000 (UTC)
Subject: [Buildroot] [Bug 3715] bunzip2 is forcefully selected by some
 packages no matter if busybox already provides it
In-Reply-To: <bug-3715-163@https.bugs.busybox.net/>
References: <bug-3715-163@https.bugs.busybox.net/>
Message-ID: <20110512130749.C4EFC834A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3715

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
What packages are you referring to exactly? Those packages normally select
bzip2 because they need the libz2 library, not because they call the
bzip2/bunzip2 programs.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
