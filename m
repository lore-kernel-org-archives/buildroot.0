From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 21:33:44 +0000
Subject: [Buildroot] [Bug 10861] Package batman_adv Makefile is missing
 include header directory
In-Reply-To: <bug-10861-163@https.bugs.busybox.net/>
References: <bug-10861-163@https.bugs.busybox.net/>
Message-ID: <bug-10861-163-yw7N6BPQ3X@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10861

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=5020cf0ae0298afb6e6f02c347e7bd476fc424ce.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
