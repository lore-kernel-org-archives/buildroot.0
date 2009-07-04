From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  4 Jul 2009 21:50:58 +0000 (UTC)
Subject: [Buildroot] [Bug 423] cairo: Allow DirectFB backend to be built.
In-Reply-To: <bug-423-163@https.bugs.busybox.net/>
References: <bug-423-163@https.bugs.busybox.net/>
Message-ID: <20090704215058.9C9C277808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=423


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-04 21:50:58 UTC ---
Hmm, the _DEPENDENCIES line is at the wrong location (it gets added if the
option is NOT enabled), but more importantly, why do we need this patch in the
first place? The cairo package has supported directfb for a long time (since
the beginning afaik) transparently, just like the X support


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
