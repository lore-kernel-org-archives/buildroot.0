From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Feb 2016 10:21:28 +0000
Subject: [Buildroot] [Bug 8696] xdriver_xf86-input-mouse install header
 files in target directory
In-Reply-To: <bug-8696-163@https.bugs.busybox.net/>
References: <bug-8696-163@https.bugs.busybox.net/>
Message-ID: <bug-8696-163-BBx5ibwu2s@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8696

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |ASSIGNED

--- Comment #5 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Yes, this has been the case for a long time now.

I even had a patch series to fix that once and for all:
    http://lists.busybox.net/pipermail/buildroot/2015-November/143562.html

But it was dismissed in favour of Gustavoz' pkg-conf fixups. However,
that series did not completely fix the Xorg weirdness, but since it
was not causing regressions (i.e. the bad paths were prsent before and
after), the pkg-conf fixes were applied, and my series got forgotten.

I'll respin that in a moment...

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
