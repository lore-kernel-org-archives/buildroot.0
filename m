From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 04 Jun 2020 22:10:37 +0000
Subject: [Buildroot] [Bug 12946] Grub: Decompressor is too big.
In-Reply-To: <bug-12946-163@https.bugs.busybox.net/>
References: <bug-12946-163@https.bugs.busybox.net/>
Message-ID: <bug-12946-163-4EiGRzpsXY@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12946

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #11 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello,

Thanks for the report. This is supposedly fixed now with commit 7e64a050fb.

Please give it a spin, and reopen if the issue is still present.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
