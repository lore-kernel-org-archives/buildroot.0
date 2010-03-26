From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Mar 2010 14:33:12 +0000 (UTC)
Subject: [Buildroot] [Bug 1327] mtd-utils compile failure due to lack of
 --sysroot in CFLAGS
In-Reply-To: <bug-1327-163@https.bugs.busybox.net/>
References: <bug-1327-163@https.bugs.busybox.net/>
Message-ID: <20100326143312.A065322F7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1327


Grant Edwards <grant.b.edwards@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #3 from Grant Edwards <grant.b.edwards@gmail.com>  2010-03-26 14:33:12 UTC ---
The current mtd.mk I grabbed from git works.  The commit I mentioned
does fix this bug.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
