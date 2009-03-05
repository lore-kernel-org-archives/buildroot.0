From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Mar 2009 12:13:24 +0000 (UTC)
Subject: [Buildroot] [Bug 145] Bump bind package to 9.5.1-P1 (security)
In-Reply-To: <bug-145-163@https.bugs.busybox.net/>
References: <bug-145-163@https.bugs.busybox.net/>
Message-ID: <20090305121324.917AF7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=145


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-05 12:13:23 UTC ---
Thanks, committed as r25536. I changed it to not install into staging_dir, as
nothing seems to need it.

Regarding the init scripts: I would prefer to not add extra config options for
it, but instead only install the script if it isn't present in the
target_skeleton.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
