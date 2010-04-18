From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Apr 2010 20:35:01 +0000 (UTC)
Subject: [Buildroot] [Bug 1537] dev entries not created anymore
In-Reply-To: <bug-1537-163@https.bugs.busybox.net/>
References: <bug-1537-163@https.bugs.busybox.net/>
Message-ID: <20100418203501.4A0803044@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1537


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2010-04-18 20:35:00 UTC ---
Fixed in git by Thomas with the introduction of the BR2_ROOTFS_DEVICE_TABLE
kconfig setting.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
