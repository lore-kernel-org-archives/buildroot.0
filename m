From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 24 Oct 2014 23:30:32 +0000 (UTC)
Subject: [Buildroot] [Bug 7442] rootfs remount does not work as expected
	with sysvinit
In-Reply-To: <bug-7442-163@https.bugs.busybox.net/>
References: <bug-7442-163@https.bugs.busybox.net/>
Message-ID: <20141024233032.1BF7CAF4D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7442

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> 2014-10-24 23:30:30 UTC ---
Fixed in git by Gustavo:

http://git.buildroot.net/buildroot/commit/?id=bcb835b042d385bac801e00cff2f1dbacff93629

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
