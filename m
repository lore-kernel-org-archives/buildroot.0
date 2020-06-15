From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Jun 2020 21:23:59 +0000
Subject: [Buildroot] [Bug 12941] Python GObject fails to build when using
 BR2_PER_PACKAGE_DIRECTORIES
In-Reply-To: <bug-12941-163@https.bugs.busybox.net/>
References: <bug-12941-163@https.bugs.busybox.net/>
Message-ID: <bug-12941-163-AMzaNqlXrS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12941

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |FIXED

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Daniel, All,

Thanks for the report. This is now supposedly fixed with the patch from
Adam, that was applied as commit 2158c87206.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
