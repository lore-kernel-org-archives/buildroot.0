From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 24 Apr 2011 21:35:31 +0000 (UTC)
Subject: [Buildroot] [Bug 3571] u-boot: fw_printenv does not build
In-Reply-To: <bug-3571-163@https.bugs.busybox.net/>
References: <bug-3571-163@https.bugs.busybox.net/>
Message-ID: <20110424213531.3845582A3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3571

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
I was first a bit concerned about how long this env target had been supported
(as we support older u-boot versions as well), but it seems like it has been
there very long.

Thanks, committed with minor tweaks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
