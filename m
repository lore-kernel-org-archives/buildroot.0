From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Apr 2015 10:50:44 +0000 (UTC)
Subject: [Buildroot] [Bug 4910] __IPC_64 bit is not expected by Kernel's
 SYSV *ctl fuctions
In-Reply-To: <bug-4910-163@https.bugs.busybox.net/>
References: <bug-4910-163@https.bugs.busybox.net/>
Message-ID: <20150429105044.AA75E81D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4910

--- Comment #1 from Bernhard Reutner-Fischer <aldot@uclibc.org> 2015-04-29 10:50:44 UTC ---
It seems we have a __ASSUME_IPC64 in kernel-features.h
Can you please cook a patch perusing / tweaking this?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
