From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Mar 2010 10:53:31 +0000 (UTC)
Subject: [Buildroot] [Bug 1387] xlib_libX11-1.3.2 can's find libjpeg
In-Reply-To: <bug-1387-163@https.bugs.busybox.net/>
References: <bug-1387-163@https.bugs.busybox.net/>
Message-ID: <20100324105331.C04AC776EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1387


Paul Jones <paul.jones@iwtech.com.au> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME




--- Comment #2 from Paul Jones <paul.jones@iwtech.com.au>  2010-03-24 10:53:30 UTC ---
Sorry for the false alarm. It turns out that I misread the error message and
misread the package help in menuconfig.

The problem was actually that the ps2pdf utility is needed (on the host
machine) from ghostscript to build documentation, and I had to recompile it to
fix the linking error (I'm a Gentoo user.)

Once Ghostscript was working correctly the problem was solved.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
