From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Jul 2009 18:39:21 +0000 (UTC)
Subject: [Buildroot] [Bug 499] make O=... busybox-menuconfig crashes
In-Reply-To: <bug-499-163@https.bugs.busybox.net/>
References: <bug-499-163@https.bugs.busybox.net/>
Message-ID: <20090729183921.5FB48774F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=499


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-29 18:39:20 UTC ---
Strange - It works here (both with a clean tree and after a full build).
The only issue I remember about O= was fixed long ago with 94b3420da9c94c3044f,
where packages that also support O= (linux, busybox, ..) got confused as it got
forwarded.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
