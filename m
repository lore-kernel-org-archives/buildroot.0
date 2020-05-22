From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 May 2020 22:13:13 +0000
Subject: [Buildroot] [Bug 12361] Init system (systemd) kills login on
 Raspberry Pi Zero
In-Reply-To: <bug-12361-163@https.bugs.busybox.net/>
References: <bug-12361-163@https.bugs.busybox.net/>
Message-ID: <bug-12361-163-spTT7p9Fm0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12361

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello,

This is suposedly fixed now with this commit that was just applied to master:

https://git.buildroot.org/buildroot/commit/?id=26c32d933eb4d841b7fbe9c1e0b61cef89665b15

Thanks for the report, and sorry for the long delay in solving this issue.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
