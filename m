From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 10 Sep 2016 13:46:17 +0000
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <bug-7892-163-6qipgYGzcA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #20 from Floris Bos <bos@je-eigen-domein.nl> ---
(In reply to Yann E. MORIN from comment #19)
>As I said in my previous comment, this is all known, and is being worked on. ;-)

Good, I wasn't sure of that, as the bug was marked RESOLVED WORKSFORME... ;-)

>Besides, there is nothing rpi-specific in this issue. It can very well be
>reprocuced with any of our qemu-targetting defconfigs.

Well, earlier in the bug report people claimed it was unreproducible with qemu.
Then again it probably wasn't tested as initramfs.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
