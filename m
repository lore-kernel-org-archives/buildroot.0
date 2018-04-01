From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 01 Apr 2018 11:56:05 +0000
Subject: [Buildroot] [Bug 10096] SH4 toolchain does not build Linux kernel
 magicpanelr2_defconfig
In-Reply-To: <bug-10096-163@https.bugs.busybox.net/>
References: <bug-10096-163@https.bugs.busybox.net/>
Message-ID: <bug-10096-163-64XXZ8zv1I@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10096

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This problem can be reproduced with the following defconfig:

BR2_sh=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="magicpanelr2"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
