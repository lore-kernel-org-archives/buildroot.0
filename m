From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 Oct 2010 21:35:05 +0000 (UTC)
Subject: [Buildroot] [Bug 2707] Can't compile linux kernel using buildroot +
	crosstool-ng
In-Reply-To: <bug-2707-163@https.bugs.busybox.net/>
References: <bug-2707-163@https.bugs.busybox.net/>
Message-ID: <20101017213505.F00EF8D2F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2707

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
Fixed by moving KERNEL_ARCH to the toplevel Makefile, thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
