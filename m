From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 May 2021 21:00:08 +0000
Subject: [Buildroot] [Bug 13791] The QEMU compiled by Buildroot does not
 support alsa or pulseaudio drivers for soundcard forwarding
In-Reply-To: <bug-13791-163@https.bugs.busybox.net/>
References: <bug-13791-163@https.bugs.busybox.net/>
Message-ID: <bug-13791-163-H3ck1SNMeb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13791

--- Comment #3 from WZab <wzab01@gmail.com> ---
(In reply to Arnout Vandecappelle from comment #1)
Unfortunately we have to use the patched QEMU (to add the GUI-connected GPIO
emulation for our students -
http://koral.ise.pw.edu.pl/~wzab/artykuly/Teaching_electronics_disease_virtual_lab.pdf
).
The version for BR 2021.02 is in
https://github.com/wzab/BR_Internet_Radio/tree/gpio_simple_2021.02/QemuVirt64

-- 
You are receiving this mail because:
You are on the CC list for the bug.
