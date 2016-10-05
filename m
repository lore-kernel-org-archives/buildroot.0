From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 Oct 2016 09:39:34 +0000
Subject: [Buildroot] [Bug 9326] Odroid-C2 build results in non-bootable image
In-Reply-To: <bug-9326-163@https.bugs.busybox.net/>
References: <bug-9326-163@https.bugs.busybox.net/>
Message-ID: <bug-9326-163-zyXrZA2fZi@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9326

--- Comment #2 from gahabana at gmail.com ---
hi @Erico, 
great points - am travelling until weekend, but can confirm (remotely) that by
changing the Toolchain to gcc-4.9, it builds just fine. I assume it will work.
Is there a possibility within buildroot to tell it that for Kernel and U-Boot
it should use GCC < 5.0 and the rest of the packages can/could be built on 5.x
(so that we keep older toolchain for Odroid-C2 kernel/uboot) and newer for
packages ? Should be more compatible/tested down the road, but i am not sure
how that could be added to package files ?

thank you !

-- 
You are receiving this mail because:
You are on the CC list for the bug.
