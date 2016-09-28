From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Sep 2016 16:13:10 +0000
Subject: [Buildroot] [Bug 9301] U-boot fails to build with default
 zynq_zed_defconfig configuration
In-Reply-To: <bug-9301-163@https.bugs.busybox.net/>
References: <bug-9301-163@https.bugs.busybox.net/>
Message-ID: <bug-9301-163-XEcNbyQROz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9301

--- Comment #3 from matt.kraai at abbott.com ---
I've also verified that adding $(BR2_TARGET_UBOOT_SPL_NAME) to
UBOOT_MAKE_TARGET if the former is non-empty fixes this problem.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
