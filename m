From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Aug 2020 21:31:21 +0000
Subject: [Buildroot] [Bug 13166] python-rpi-gpio: does not work against
 aarch64, unintentional side-effect of gcc-10 patch
In-Reply-To: <bug-13166-163@https.bugs.busybox.net/>
References: <bug-13166-163@https.bugs.busybox.net/>
Message-ID: <bug-13166-163-IbT2Muz8r6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13166

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #9 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Christian, All,

Fixed with commit ae6bd1eb44. Thanks for the report.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
