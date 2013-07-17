From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Jul 2013 07:39:36 +0000 (UTC)
Subject: [Buildroot] [Bug 6392] Extended ARM uImage kernel options
In-Reply-To: <bug-6392-163@https.bugs.busybox.net/>
References: <bug-6392-163@https.bugs.busybox.net/>
Message-ID: <20130717073936.0F3159A5C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6392

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-07-17 07:39:43 UTC ---
Thanks for this contribution.

Can you give examples of usage of BR2_LINUX_KERNEL_MAKE_FLAGS ? Why would it be
limited to ARM and uImage ?

Also, I don't quite understand BR2_LINUX_KERNEL_NATIVE_CONFIG. When you unpack
a kernel tarball or a Git tree, there's normally no .config in the kernel tree,
and it has to be created, either starting from a defconfig, or using one of the
menuconfig/nconfig/gconfig/xconfig configuration interfaces.

Could you expand a bit on the use cases? Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
