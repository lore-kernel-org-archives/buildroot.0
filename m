From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  9 Apr 2009 09:47:05 +0000 (UTC)
Subject: [Buildroot] [Bug 245] lzop: new package
In-Reply-To: <bug-245-163@https.bugs.busybox.net/>
References: <bug-245-163@https.bugs.busybox.net/>
Message-ID: <20090409094705.C6E77769D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=245


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-04-09 09:47:05 UTC ---
We don't do 'default n' in Kconfig (as that's default anyway), but otherwise
looks good. Committed as r26041.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
