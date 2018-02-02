From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Feb 2018 21:39:25 +0000
Subject: [Buildroot] [Bug 10141] Squashfs extended attribute failures
In-Reply-To: <bug-10141-163@https.bugs.busybox.net/>
References: <bug-10141-163@https.bugs.busybox.net/>
Message-ID: <bug-10141-163-lVQiburr5z@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10141

Bob <cmg427@hotmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #9 from Bob <cmg427@hotmail.com> ---
This issue still affects me. I'm using fakeroot and mksquashfs to build
multiple squashfs from different mounts.

Some context... I'm building 5 fairly large squashfs in parallel.
The xattrs intermittently fail to get copied over. The more xattrs I have and
the more squashfs I'm building in parallel, the more it will fail to copy over
the xattrs.

Each squashfs is about 500mb in size.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
