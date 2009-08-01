From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 Aug 2009 19:17:35 +0000 (UTC)
Subject: [Buildroot] [Bug 171] xorg-server / kernel headers 2.6.26 -
 vm86.c:225: error: 'IF_MASK' undeclared (first use in this function)
In-Reply-To: <bug-171-163@https.bugs.busybox.net/>
References: <bug-171-163@https.bugs.busybox.net/>
Message-ID: <20090801191735.9957C777DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=171


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-01 19:17:34 UTC ---
Fixed upstream in xserver 1.5.3, and in BR by the version bump in 2831a05d03d


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
