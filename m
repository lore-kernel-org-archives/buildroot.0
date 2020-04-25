From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 25 Apr 2020 12:10:15 +0000
Subject: [Buildroot] [Bug 11866] iniramfs file system fails to boot using
 Grub on EFI x86_64
In-Reply-To: <bug-11866-163@https.bugs.busybox.net/>
References: <bug-11866-163@https.bugs.busybox.net/>
Message-ID: <bug-11866-163-VwJjKDvUmO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11866

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #7 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Pete, Timo, All,

Fixed with commit 98a6f1fc02e41ac30db24ac2b7262033faabacde.

Thanks for the patience while waiting for that fix.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
