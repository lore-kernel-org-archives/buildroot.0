From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  4 May 2010 21:14:11 +0000 (UTC)
Subject: [Buildroot] [Bug 1525] Package hal deletes a whole
	<target>/etc/rc.d directory
In-Reply-To: <bug-1525-163@https.bugs.busybox.net/>
References: <bug-1525-163@https.bugs.busybox.net/>
Message-ID: <20100504211411.F1C628D287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1525

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Fixed in git (79db1ff5ac)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
