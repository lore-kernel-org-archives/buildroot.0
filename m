From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Jun 2020 07:18:25 +0000
Subject: [Buildroot] [Bug 12986] Mtools: Error converting to codepage 850
In-Reply-To: <bug-12986-163@https.bugs.busybox.net/>
References: <bug-12986-163@https.bugs.busybox.net/>
Message-ID: <bug-12986-163-7eluGNp2zn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12986

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Melanie, All,

Thanks for the report. This is now supposedly fixed with the
patch from Fabrice, applied as commit ac4a61e0ea.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
