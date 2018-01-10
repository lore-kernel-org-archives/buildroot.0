From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 21:17:27 +0000
Subject: [Buildroot] [Bug 10511] Packages get downloaded uncompressed with
 wget
In-Reply-To: <bug-10511-163@https.bugs.busybox.net/>
References: <bug-10511-163@https.bugs.busybox.net/>
Message-ID: <bug-10511-163-pZwrSHlUPZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10511

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Thomas, Jean, All,

> - Detect if wget >= 1.19.2, and pass --compression=none

That looks like the best solution IMHO. Unfortunately, wget versions < 1.19.2
do not accept the --compression option, so we really must make it conditional.

My 2ct.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
