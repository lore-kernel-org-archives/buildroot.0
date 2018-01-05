From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Jan 2018 16:58:51 +0000
Subject: [Buildroot] [Bug 10636] BR2_SYSTEM_DHCP is removed from .config and
 breaks auto eth0
In-Reply-To: <bug-10636-163@https.bugs.busybox.net/>
References: <bug-10636-163@https.bugs.busybox.net/>
Message-ID: <bug-10636-163-CXkwO6e7LY@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10636

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |INVALID

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Patrice,

BR2_SYSTEM_DHCP is only available if you use the default skeleton, and any
of busybox, ifupdown or systemd-networkd package.

If you use your own custom skeleton, you are responsible for providing the
necessary files (usually /etc/network/interfaces) in your custom skeleton.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
