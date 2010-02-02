From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  2 Feb 2010 20:06:19 +0000 (UTC)
Subject: [Buildroot] [Bug 1027] Busybox flqsh commands conflict with those
	from mtd-utils
In-Reply-To: <bug-1027-163@https.bugs.busybox.net/>
References: <bug-1027-163@https.bugs.busybox.net/>
Message-ID: <20100202200620.14A677770A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1027


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2010-02-02 20:06:18 UTC ---
That is how we normally do it (E.G. let the big versions "win" if both are
enabled). What would you suggest we do instead?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
