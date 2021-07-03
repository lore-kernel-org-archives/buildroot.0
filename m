From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Jul 2021 17:05:08 +0000
Subject: [Buildroot] [Bug 13326] regarding dtc error in buildroot source code
In-Reply-To: <bug-13326-163@https.bugs.busybox.net/>
References: <bug-13326-163@https.bugs.busybox.net/>
Message-ID: <bug-13326-163-hFCZYPXVIl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13326

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Anil, All,

As stated by Fabrice, this is now fixed for the dtc package he pointed at.

The traces you pasted are supposedly from the Linux kernel. Since there
are so many versions of the Linux kernel, we can't easily bundle a patch
for the dtc copy bundled in the kernel sources. You will have to backport
the upstream commit e33a814e772cdc36436c8c188d8c42d019fda639, using
BR2_GLOBAL_PATCH_DIR.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
