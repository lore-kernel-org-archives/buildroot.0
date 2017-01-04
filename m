From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Jan 2017 21:42:14 +0000
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <bug-7892-163-Z7L4LXKv2A@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #24 from Andrey Smirnov <andrew.smirnov@gmail.com> ---
(In reply to Yann E. MORIN from comment #23)

Yann,

Thank you, this is even better than I could've hoped for!

I have a custom PowerPC (e500) based system I emulate in QEMU (I didn't try
real HW since I could easily reproduce the bug in QEMU) and I did try out both
branches you mentioned. First one definitely fixed the journalctl problems,
second, given how it seem to be missing anything similar to "system: make
systemd work on a read-only rootfs", OTOH didn't (which was expected).

I would love to see your work go upstream sooner rather than later, so if
there's any meaningful way we can collaborate on this, besides me providing
"Tested-by" etc. for your commits, please let me know (feel free to contact me
via e-mail if that's more convenient)

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
