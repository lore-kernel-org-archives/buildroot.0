From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Sep 2014 13:17:45 +0000 (UTC)
Subject: [Buildroot] [Bug 7358] rpi-userland: linking with bcm_host doesn't
 give vc_dispmanx_* functions
In-Reply-To: <bug-7358-163@https.bugs.busybox.net/>
References: <bug-7358-163@https.bugs.busybox.net/>
Message-ID: <20140903131745.2D40A9D561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7358

--- Comment #1 from Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> 2014-09-03 13:17:44 UTC ---
I think you need EGL (egl.pc). Forget bcm_host. See commit
6a29ce0d1648baccb311e78c7c906ca27255e895.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
