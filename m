From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 16 Jun 2021 19:09:00 +0000
Subject: [Buildroot] [Bug 13846] BR2_PACKAGE_LVM2_STANDARD_INSTALL should be
 default to y as before
In-Reply-To: <bug-13846-163@https.bugs.busybox.net/>
References: <bug-13846-163@https.bugs.busybox.net/>
Message-ID: <bug-13846-163-HARdd7CGn6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13846

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |FIXED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Dominique, All,

Thanks for the report.

We believe that was fixed with commit 6d758f59e6 (package/lvm2: default
standard install to y) submitted by Arnout.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
