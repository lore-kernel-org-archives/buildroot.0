From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 04 Dec 2016 13:39:16 +0000
Subject: [Buildroot] [Bug 9461] toolchain Linaro AArch64 2016.11 compile
	error
In-Reply-To: <bug-9461-163@https.bugs.busybox.net/>
References: <bug-9461-163@https.bugs.busybox.net/>
Message-ID: <bug-9461-163-Kcwvyo8UqP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9461

--- Comment #5 from romain.naour at gmail.com ---
Hi,

The odroidc2-3.14.y branch on github [1] is still maintained and you have just
to update the git hash to the latest version to fix your build issue.

Also it seems that the Amlogic S905 SoC used in your board [2] is now available
with the latest kernel version (v4.8) [3].

I don't have this board, can you test with the new 3.14 hardkernel or 4.8
kernel version and summit a patch bumping the version ?

[1]
https://github.com/hardkernel/linux/commits/odroidc2-3.14.y/include/linux/compiler-gcc.h
[2] http://www.hardkernel.com/main/products/prdt_info.php
[3]
http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/arch/arm64/Kconfig.platforms?h=linux-4.8.y#n81

-- 
You are receiving this mail because:
You are on the CC list for the bug.
