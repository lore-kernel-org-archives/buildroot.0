From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Feb 2017 20:23:37 +0000
Subject: [Buildroot] [Bug 9506] Collectd 5.7.0 fails to build with libcrypt
In-Reply-To: <bug-9506-163@https.bugs.busybox.net/>
References: <bug-9506-163@https.bugs.busybox.net/>
Message-ID: <bug-9506-163-4lA32yp5Pz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9506

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks Roland for your bug report. This issue has been fixed in January by
commit
https://git.buildroot.org/buildroot/commit/package/collectd?id=01cd62a31c2e04ea9acaca9cfca527a938e40e85.
Do not hesitate to let us know if you think the issue is still unresolved for
you.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
