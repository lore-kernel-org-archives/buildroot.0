From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Mar 2009 11:17:54 +0000 (UTC)
Subject: [Buildroot] [Bug 191] alsa-lib ARM binaries always built with EABI
In-Reply-To: <bug-191-163@https.bugs.busybox.net/>
References: <bug-191-163@https.bugs.busybox.net/>
Message-ID: <20090318111754.BD96476262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=191


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-18 11:17:54 UTC ---
Yes, I have been asking the ARM people about this for some time. I think we
should actually remove the entire conditional, as EABI builds already have
-mabi=aapcs-linux in their CFLAGS.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
