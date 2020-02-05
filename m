From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 Feb 2020 16:49:50 +0000
Subject: [Buildroot] [Bug 11996] opencv3 SIGILL on Cortex-A5 with VFPv4-D16
In-Reply-To: <bug-11996-163@https.bugs.busybox.net/>
References: <bug-11996-163@https.bugs.busybox.net/>
Message-ID: <bug-11996-163-f93Z6ocwtq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11996

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=4d0f3dd8709f9f31a81eaa8a62cb35ef6ddddeaf

-- 
You are receiving this mail because:
You are on the CC list for the bug.
