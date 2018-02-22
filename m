From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Feb 2018 13:30:47 +0000
Subject: [Buildroot] [Bug 10796] Cannot generate cpio image without
 selecting CONFIG_BLK_DEV_INITRD
In-Reply-To: <bug-10796-163@https.bugs.busybox.net/>
References: <bug-10796-163@https.bugs.busybox.net/>
Message-ID: <bug-10796-163-KCKA5KM8PL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10796

--- Comment #2 from adyke at harris.com ---
(In reply to Thomas Petazzoni from comment #1)
My use case is to generate a build that can be made into a disk image and also
be PXE booted. For PXE booting, I need the cpio file. But for installing to
disk, I don't want the root filesystem built in to the kernel.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
