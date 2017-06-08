From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 08 Jun 2017 21:22:01 +0000
Subject: [Buildroot] [Bug 9911] qt5 does not build on sparc
In-Reply-To: <bug-9911-163@https.bugs.busybox.net/>
References: <bug-9911-163@https.bugs.busybox.net/>
Message-ID: <bug-9911-163-yjaWrElNC3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9911

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=a3fd13804fc801fc948d27f9fe932fce7201655a
and
https://git.buildroot.org/buildroot/commit/?id=7d286be4f96cfb731e184c3e8cfea27a031bde3c.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
