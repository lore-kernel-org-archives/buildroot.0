From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Nov 2009 22:42:13 +0000 (UTC)
Subject: [Buildroot] [Bug 715] Bump libidn package to 1.15 and other fixes
In-Reply-To: <bug-715-163@https.bugs.busybox.net/>
References: <bug-715-163@https.bugs.busybox.net/>
Message-ID: <20091115224213.27F0077785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=715


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-11-15 22:42:12 UTC ---
Thanks, committed - But you forgot to add a kconfig option for
BR2_PACKAGE_LIBIDN_BINARY - Care to send a followup patch adding it?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
