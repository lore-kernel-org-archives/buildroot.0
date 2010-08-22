From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Aug 2010 06:41:13 +0000 (UTC)
Subject: [Buildroot] [Bug 2401] sysvinit-2.86 fails to build on MIPS because
 is missing -lcrypt
In-Reply-To: <bug-2401-163@https.bugs.busybox.net/>
References: <bug-2401-163@https.bugs.busybox.net/>
Message-ID: <20100822064113.CB9A088F5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2401

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Thanks, fixed in my for-2010.08 branch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
