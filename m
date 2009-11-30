From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Nov 2009 10:03:27 +0000 (UTC)
Subject: [Buildroot] [Bug 707] Can`t configure fltk-1.1.7 . configure:
 error: Configure could not find required X11 libraries
In-Reply-To: <bug-707-163@https.bugs.busybox.net/>
References: <bug-707-163@https.bugs.busybox.net/>
Message-ID: <20091130100327.CBEB3777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=707


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-11-30 10:03:22 UTC ---
fltk needed libXt - Fixed in git (b48fb8c4aa)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
