From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 01 Mar 2020 18:19:53 +0000
Subject: [Buildroot] [Bug 12576] 2020.02-RC1: error while loading shared
 libraries: libsystemd-shared-244.so
In-Reply-To: <bug-12576-163@https.bugs.busybox.net/>
References: <bug-12576-163@https.bugs.busybox.net/>
Message-ID: <bug-12576-163-TUYeLRZvPk@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12576

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Melanie, All,

Thanks for the report, fixed with:
https://git.buildroot.org/buildroot/commit/?id=dabb5181ad2873e87935b778d1f6772ec361fa16

Thanks Thomas for the hint, too. ;-)

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
