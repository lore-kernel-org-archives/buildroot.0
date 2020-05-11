From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 11 May 2020 21:12:11 +0000
Subject: [Buildroot] [Bug 12886] GMP built in wrong order (?)
In-Reply-To: <bug-12886-163@https.bugs.busybox.net/>
References: <bug-12886-163@https.bugs.busybox.net/>
Message-ID: <bug-12886-163-LbOrpj05e1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12886

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
We do not build the host libgcc, it is part of your system, so it is already
built before host-gmp.

Could you give a longer part of your host-gmp failure, so that we can see what
the actual problem is ? Could you also provide a defconfig to reproduce the
failure, and give more details about what your Linux system is ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
