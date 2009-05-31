From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 31 May 2009 05:45:45 +0000 (UTC)
Subject: [Buildroot] [Bug 363] uClibc build fails in 2009.05-rc3
In-Reply-To: <bug-363-163@https.bugs.busybox.net/>
References: <bug-363-163@https.bugs.busybox.net/>
Message-ID: <20090531054545.E11037784B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=363


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-05-31 05:45:45 UTC ---
NTPL isn't supported by uClibc on mips (yet). Select BR2_PTHREADS_OLD and it
should work.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
