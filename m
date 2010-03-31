From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Mar 2010 10:16:44 +0000 (UTC)
Subject: [Buildroot] [Bug 1387] xlib_libX11-1.3.2 can's find libjpeg
In-Reply-To: <bug-1387-163@https.bugs.busybox.net/>
References: <bug-1387-163@https.bugs.busybox.net/>
Message-ID: <20100331101644.86D7B7FA49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1387


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|WORKSFORME                  |FIXED




--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  2010-03-31 10:16:44 UTC ---
Added --disable-specs to the configure args in git, should disable doc build.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
