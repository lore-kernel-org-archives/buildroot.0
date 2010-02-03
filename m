From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Feb 2010 16:25:54 +0000 (UTC)
Subject: [Buildroot] [Bug 1027] Busybox flqsh commands conflict with those
	from mtd-utils
In-Reply-To: <bug-1027-163@https.bugs.busybox.net/>
References: <bug-1027-163@https.bugs.busybox.net/>
Message-ID: <20100203162554.2D7FA776BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1027


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2010-02-03 16:25:53 UTC ---
Ahh, ok - That's something completely else. I have updated the mtd-utils
package in git to 1.3.1, and fixed the target install to use 'install', which
doesn't follow symlinks.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
