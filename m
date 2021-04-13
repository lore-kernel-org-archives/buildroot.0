From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Apr 2021 19:16:07 +0000
Subject: [Buildroot] [Bug 13271] systemd-resolved: /etc/resolv.conf link
 broken on per-package build
In-Reply-To: <bug-13271-163@https.bugs.busybox.net/>
References: <bug-13271-163@https.bugs.busybox.net/>
Message-ID: <bug-13271-163-0ZRCH4wsOz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13271

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Michael, All,

Thanks for the report.

This is now supposedly fixed with commit 511fbda0be that has just been pushed.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
