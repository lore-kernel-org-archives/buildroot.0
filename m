From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Aug 2018 20:07:53 +0000
Subject: [Buildroot] [Bug 11246] Glibc 2.28 - fails to build host-bison and
 host-m4
In-Reply-To: <bug-11246-163@https.bugs.busybox.net/>
References: <bug-11246-163@https.bugs.busybox.net/>
Message-ID: <bug-11246-163-qkGm20W9Yv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11246

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Bison has been fixed by
https://git.buildroot.org/buildroot/commit/package/bison?id=373ac58b82d2430b745e90c7c8b39e319949882a,
so the bug is fixed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
