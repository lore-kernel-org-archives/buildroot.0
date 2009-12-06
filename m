From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  6 Dec 2009 19:00:29 +0000 (UTC)
Subject: [Buildroot] [Bug 749] Bump usbutils package to version 0.86
In-Reply-To: <bug-749-163@https.bugs.busybox.net/>
References: <bug-749-163@https.bugs.busybox.net/>
Message-ID: <20091206190029.8F11C777DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=749


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-12-06 19:00:28 UTC ---
Committed, thanks (remove unneeded ac_cv_func_malloc_0_nonnull=yes preset as
it's already in TARGET_CONFIGURE_ARGS)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
