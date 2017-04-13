From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Apr 2017 19:56:25 +0000
Subject: [Buildroot] [Bug 9756] glibc fails to build on
 buildroot-sh4*-buildroot-linux-gnu
In-Reply-To: <bug-9756-163@https.bugs.busybox.net/>
References: <bug-9756-163@https.bugs.busybox.net/>
Message-ID: <bug-9756-163-zV3jgmkIQ2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9756

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks, fixed in
https://git.buildroot.org/buildroot/commit/?id=5f2cff973a8a64411d85ccb9d5c9a40962d67552.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
