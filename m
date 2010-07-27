From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Jul 2010 20:55:50 +0000 (UTC)
Subject: [Buildroot] [Bug 1405] WebKit fails to build because
 pthread_getattr_np is not implemented in uClibc
In-Reply-To: <bug-1405-163@https.bugs.busybox.net/>
References: <bug-1405-163@https.bugs.busybox.net/>
Message-ID: <20100727205550.AE6AC8349A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1405

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Fixed in git, thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
