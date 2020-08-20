From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Aug 2020 22:25:24 +0000
Subject: [Buildroot] [Bug 13166] python-rpi-gpio: does not work against
 aarch64, unintentional side-effect of gcc-10 patch
In-Reply-To: <bug-13166-163@https.bugs.busybox.net/>
References: <bug-13166-163@https.bugs.busybox.net/>
Message-ID: <bug-13166-163-ngvHS2PyRe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13166

--- Comment #7 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Christian, care to test the attached patch, please?

The runtime test demonstrates that it is possible to import the
module, but I have no way to test it on real hardware for now...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
