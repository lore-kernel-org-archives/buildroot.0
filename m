From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Oct 2017 21:01:47 +0000
Subject: [Buildroot] [Bug 10471] Building a mipsel kernel format vmlinuz (+
 gzip + initrd) generates non-compressed, non-bootable image
In-Reply-To: <bug-10471-163@https.bugs.busybox.net/>
References: <bug-10471-163@https.bugs.busybox.net/>
Message-ID: <bug-10471-163-ACq2QmCckN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10471

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Could you reproduce this problem with a MIPS defconfig available in the
upstream Linux kernel?

I personally really don't want to debug stuff deep down in the Broadcom BSP.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
