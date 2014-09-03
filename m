From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Sep 2014 15:47:42 +0000 (UTC)
Subject: [Buildroot] [Bug 7358] rpi-userland: linking with bcm_host doesn't
 give vc_dispmanx_* functions
In-Reply-To: <bug-7358-163@https.bugs.busybox.net/>
References: <bug-7358-163@https.bugs.busybox.net/>
Message-ID: <20140903154742.094419D5DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7358

--- Comment #3 from Maarten ter Huurne <maarten@treewalker.org> 2014-09-03 15:47:41 UTC ---
By the way, I think that SDL2 should not be built for the host. SDL2 is a
library for interactive use and that has no place in an automated build, in my
opinion.

(The SDL 1.2 host build was added in commit 102f86e8 to support XBMC's build.)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
