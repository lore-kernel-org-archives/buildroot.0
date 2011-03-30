From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Mar 2011 21:19:27 +0000 (UTC)
Subject: [Buildroot] [Bug 3529] alsa-lib 1.0.24.1 build fails with daily
 snapshot (2011-03-29)
In-Reply-To: <bug-3529-163@https.bugs.busybox.net/>
References: <bug-3529-163@https.bugs.busybox.net/>
Message-ID: <20110330211927.7DCDC816A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3529

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org>  ---
Ahh, that explains it. versionsort() was only added to uClibc back in Feb 2009,
and 0.9.30 is from 2008. Why are you using such an ancient uClibc version
(together with a quite recent gcc even)? uClibc 0.9.32 is very close to release
by now.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
