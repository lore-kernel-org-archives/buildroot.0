From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 14 Apr 2012 21:04:50 +0000 (UTC)
Subject: [Buildroot] [Bug 5018] dialog broken: exits with assert in uClibc
In-Reply-To: <bug-5018-163@https.bugs.busybox.net/>
References: <bug-5018-163@https.bugs.busybox.net/>
Message-ID: <20120414210450.B108696AC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5018

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2012-04-14 21:04:50 UTC ---
defconfigs changed to use UCLIBC_HAS_CTYPE_CHECKED in git by Gustavoz

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
