From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 May 2021 23:20:14 +0000
Subject: [Buildroot] [Bug 13791] The QEMU compiled by Buildroot does not
 support alsa or pulseaudio drivers for soundcard forwarding
In-Reply-To: <bug-13791-163@https.bugs.busybox.net/>
References: <bug-13791-163@https.bugs.busybox.net/>
Message-ID: <bug-13791-163-lW4x9xMUx4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13791

--- Comment #6 from WZab <wzab01@gmail.com> ---
The temporary workaround is also available in the BR_Internet_Radio:

https://github.com/wzab/BR_Internet_Radio/commit/bdf7afed292ec0408fe908df42a4bc298031141a

https://github.com/wzab/BR_Internet_Radio/commit/2117504dc040cdc679e379eee87cde3c498c694d

-- 
You are receiving this mail because:
You are on the CC list for the bug.
