From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 17:56:01 +0000
Subject: [Buildroot] [Bug 9546] seems
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS do nothing
In-Reply-To: <bug-9546-163@https.bugs.busybox.net/>
References: <bug-9546-163@https.bugs.busybox.net/>
Message-ID: <bug-9546-163-g63hPhCjed@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9546

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |INVALID

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Artem,

Please compare board/raspberrypi/genimage-raspberrypi.cfg and
board/raspberrypi3/genimage-raspberrypi3.cfg . You'll see how
to add the overlays .dtbo files for your specific rpi version.

The configuration files provided in Buildroot are only basic
configs; you have to adapt them to your own needs.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
