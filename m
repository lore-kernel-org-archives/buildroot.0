From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Mar 2010 08:48:06 +0000 (UTC)
Subject: [Buildroot] [Bug 1387] xlib_libX11-1.3.2 can's find libjpeg
In-Reply-To: <bug-1387-163@https.bugs.busybox.net/>
References: <bug-1387-163@https.bugs.busybox.net/>
Message-ID: <20100331084806.105A48D1CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1387





--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2010-03-31 08:48:05 UTC ---
(In reply to comment #2)
> The problem was actually that the ps2pdf utility is needed (on the host
> machine) from ghostscript to build documentation, and I had to recompile it to
> fix the linking error (I'm a Gentoo user.)
> 
> Once Ghostscript was working correctly the problem was solved.

What package needed ps2pdf? Perhaps we can disable the doc build.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
