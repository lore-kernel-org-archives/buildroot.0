From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Apr 2015 20:59:17 +0000 (UTC)
Subject: [Buildroot] [Bug 7760] botan: wrong prefix in botan-1.10.pc
In-Reply-To: <bug-7760-163@https.bugs.busybox.net/>
References: <bug-7760-163@https.bugs.busybox.net/>
Message-ID: <20150410205917.B073F807E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7760

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> 2015-04-10 20:59:17 UTC ---
Fixed by:

commit 7536a7354c92e0ec2760479a9d62e792703154d7
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Fri Apr 10 17:55:23 2015 +0200

    botan: pass --prefix=/usr to fix .pc file

Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
