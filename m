From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Aug 2009 08:15:21 +0000 (UTC)
Subject: [Buildroot] [Bug 531] let e2fsprogs package to export headers to
 staging dir if needed
In-Reply-To: <bug-531-163@https.bugs.busybox.net/>
References: <bug-531-163@https.bugs.busybox.net/>
Message-ID: <20090831081521.CD7C677740@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=531





--- Comment #2 from Daniele Salvatore Albano <d.albano@gmail.com>  2009-08-31 08:15:21 UTC ---
This patch just add headers export to staging dir, not liblkid library support
... but yes, can be useful have the ability to put this library into the
target.

I made this modification to fix compilation of util-linux, he need only the
header, not the library (however i didn't tested the resulting binary because
i'm having problem to get a working initrd for my rootfs)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
