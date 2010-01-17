From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 Jan 2010 23:32:13 +0000 (UTC)
Subject: [Buildroot] [Bug 841] Build error
In-Reply-To: <bug-841-163@https.bugs.busybox.net/>
References: <bug-841-163@https.bugs.busybox.net/>
Message-ID: <20100117233213.9209B776A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=841


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2010-01-17 23:32:12 UTC ---
Thanks for the patch, but a simpler fix is just to tell mtd-utils to use the
bcopy emulation (NEED_BCOPY) like we do for the git version. I've committed a
fix doing that earlier tonight (6a772086b7)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
