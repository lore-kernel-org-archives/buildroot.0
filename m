From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Feb 2017 20:43:28 +0000
Subject: [Buildroot] [Bug 9656] util-linux: schedutils doesn't build on
 target w/o enabling basic binaries
In-Reply-To: <bug-9656-163@https.bugs.busybox.net/>
References: <bug-9656-163@https.bugs.busybox.net/>
Message-ID: <bug-9656-163-oZI0VLoQie@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9656

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=125213d6164a395f7d0bfb136f3a873a02630ebc.

Thanks Carlos for having investigated and fixed the issue!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
