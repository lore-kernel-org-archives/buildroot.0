From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 30 Jun 2018 20:07:44 +0000
Subject: [Buildroot] [Bug 11111] raspberry pi 3 b+: missing BSP for 64-bit
 kernel
In-Reply-To: <bug-11111-163@https.bugs.busybox.net/>
References: <bug-11111-163@https.bugs.busybox.net/>
Message-ID: <bug-11111-163-iSAzWaxPoI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11111

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=722c11ce7b25a1925498483ef58f59d0931b2ca7.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
