From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Oct 2009 22:00:24 +0000 (UTC)
Subject: [Buildroot] [Bug 511] New package usb_modeswitch
In-Reply-To: <bug-511-163@https.bugs.busybox.net/>
References: <bug-511-163@https.bugs.busybox.net/>
Message-ID: <20091029220025.27FFD7757D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=511


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-10-29 22:00:23 UTC ---
Thanks, committed - It's not needed to override the build step though, you can
just set the MAKE_OPT variable.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
