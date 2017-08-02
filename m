From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Aug 2017 21:26:23 +0000
Subject: [Buildroot] [Bug 10141] Squashfs extended attribute failures
In-Reply-To: <bug-10141-163@https.bugs.busybox.net/>
References: <bug-10141-163@https.bugs.busybox.net/>
Message-ID: <bug-10141-163-EV6w6UR3qO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10141

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Clayton,

As a stop-gap measure, I've sent a patch that makes mksquashfs honour
the configured number of parallel jobs:
    https://patchwork.ozlabs.org/patch/796879/

Of course, if you use auto-caclulation, that won't help. But if you
already used a lower limit on yout build jobs, that may help.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
