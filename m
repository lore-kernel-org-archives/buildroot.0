From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Mar 2010 15:59:28 +0000 (UTC)
Subject: [Buildroot] [Bug 1297] Add ability to give additional args to
 $(DOWNLOAD) for sourceforge pkgs
In-Reply-To: <bug-1297-163@https.bugs.busybox.net/>
References: <bug-1297-163@https.bugs.busybox.net/>
Message-ID: <20100322155928.B3E58776B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1297


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2010-03-22 15:59:28 UTC ---
Thanks, but this isn't needed if the direct download URLS (like the other
packages using sourceforge) is used. See package/haserl/haserl.mk for an
example.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
