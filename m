From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Mar 2021 16:28:14 +0000
Subject: [Buildroot] [Bug 13641] glibc on raspberrypi
In-Reply-To: <bug-13641-163@https.bugs.busybox.net/>
References: <bug-13641-163@https.bugs.busybox.net/>
Message-ID: <bug-13641-163-CxM2vgd6u4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13641

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Julien,

I can not reproduce the error:

    make raspberrypi_defconfig
    make menuconfig
     -> toolchain
         -> C library
             -> glibc
    make

You need to provide more information, like the full build log.

Note : be sure to start the build from scratch when you change the C library,
see the manual: https://buildroot.org/manual.html#full-rebuild

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
