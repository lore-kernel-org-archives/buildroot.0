From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Apr 2009 21:43:19 +0000 (UTC)
Subject: [Buildroot] [Bug 285] compilation of samba fails if IPV6 support is
	missing
In-Reply-To: <bug-285-163@https.bugs.busybox.net/>
References: <bug-285-163@https.bugs.busybox.net/>
Message-ID: <20090426214319.376A677456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=285


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-04-26 21:43:18 UTC ---
Thanks, committed as r26213.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
