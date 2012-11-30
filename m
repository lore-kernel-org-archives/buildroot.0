From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Nov 2012 07:07:48 +0000 (UTC)
Subject: [Buildroot] [Bug 5732] Error : package/alsa-lib/alsa-lib.mk
In-Reply-To: <bug-5732-163@https.bugs.busybox.net/>
References: <bug-5732-163@https.bugs.busybox.net/>
Message-ID: <20121130070748.2DDA5993D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5732

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2012-11-30 07:07:43 UTC ---
Thanks, fixed in git as 2b7be2f1de3e (alsa-lib: fix static linking check)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
