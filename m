From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 20 Sep 2009 08:07:03 +0000 (UTC)
Subject: [Buildroot] [Bug 477] Add sdl_sound package
In-Reply-To: <bug-477-163@https.bugs.busybox.net/>
References: <bug-477-163@https.bugs.busybox.net/>
Message-ID: <20090920080703.B3FF177785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=477


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  2009-09-20 08:07:00 UTC ---
Thanks, committed with minor changes:

 - sdl_snd -> sdl_sound
 - cleaned up help text
 - don't transform binary name
 - add option to keep playsound/playsound_simple - Off by default
 - fix uninstall when BR2_HAVE_DEVFILES isn't enabled


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
