From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 21 Oct 2017 19:41:21 +0000
Subject: [Buildroot] [Bug 10406] Beaglebone black: Buggy SGX driver version,
 swapped red and blue channels
In-Reply-To: <bug-10406-163@https.bugs.busybox.net/>
References: <bug-10406-163@https.bugs.busybox.net/>
Message-ID: <bug-10406-163-ttTfLYLwQp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10406

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
The am335x has a known hw bug regarding red/blue swap when configuring the RGB
output for 16 bit mode, so it is probably related to that.

Why things are working for SW rendering and not for GPU rendering I don't know,
but you will probably have more luck asking on the beaglebone list:

https://groups.google.com/forum/#!categories/beaglebone/beagleboardorg-beaglebone-black

-- 
You are receiving this mail because:
You are on the CC list for the bug.
