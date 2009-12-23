From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Dec 2009 09:24:12 +0000 (UTC)
Subject: [Buildroot] [Bug 823] Editor backup files (~) is copied from the
 target_skeleton.
In-Reply-To: <bug-823-163@https.bugs.busybox.net/>
References: <bug-823-163@https.bugs.busybox.net/>
Message-ID: <20091223092412.B35097780E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=823


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-12-23 09:24:11 UTC ---
Thanks, committed with a small tweak to remove in same find invocation as the
.empty removal.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
