From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 May 2015 09:37:18 +0000 (UTC)
Subject: [Buildroot] [Bug 8106] mkfs.jffs2 uses the --pagesize parameter
	incorrectly
In-Reply-To: <bug-8106-163@https.bugs.busybox.net/>
References: <bug-8106-163@https.bugs.busybox.net/>
Message-ID: <20150522093718.F0AA581E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8106

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> 2015-05-22 09:37:18 UTC ---
Committed as e3904a890de2a74c290675fdb90324a6ed83e633, thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
