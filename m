From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Sep 2011 14:13:22 +0000 (UTC)
Subject: [Buildroot] [Bug 531] let e2fsprogs package to export headers to
 staging dir if needed
In-Reply-To: <bug-531-163@https.bugs.busybox.net/>
References: <bug-531-163@https.bugs.busybox.net/>
Message-ID: <20110918141322.0BF6F8D4FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=531

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
libblkid is now part of util-linux, and both e2fsprogs and util-linux have been
reworked significantly since the bump of util-linux to 2.19.x. So, I strongly
suspect that the bug no longer exists.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
