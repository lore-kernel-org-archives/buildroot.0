From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 04 Dec 2016 20:30:47 +0000
Subject: [Buildroot] [Bug 9461] odroidc2 - toolchain Linaro AArch64 2016.11
	compile error
In-Reply-To: <bug-9461-163@https.bugs.busybox.net/>
References: <bug-9461-163@https.bugs.busybox.net/>
Message-ID: <bug-9461-163-aW8HHMbcGz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9461

--- Comment #7 from romain.naour at gmail.com ---
Thanks for the link to the other bug, I didn't notice the
BR2_GCC_VERSION_4_9_X=y in the config file.

So event with the Linaro 2016.05 toolchain, your board shouldn't boot.

I don't see what we can do, except waiting for the odroid-c2 upstream kernel
support.

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
