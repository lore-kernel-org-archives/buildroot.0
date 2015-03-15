From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Mar 2015 18:17:58 +0000 (UTC)
Subject: [Buildroot] [Bug 7931] Default configuration for Cubieboard v1 is
	outdated
In-Reply-To: <bug-7931-163@https.bugs.busybox.net/>
References: <bug-7931-163@https.bugs.busybox.net/>
Message-ID: <20150315181758.B7B9A807A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7931

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-03-15 18:17:58 UTC ---
Hum, which version of Buildroot are you using?

I see the following in
http://git.buildroot.net/buildroot/tree/configs/cubieboard_defconfig :

# Kernel
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="274a66a7bfcbaabb88d63e4eba161965383cc416"
BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
BR2_LINUX_KERNEL_DEFCONFIG="sun4i"

Which seems to indicate it's already using a 3.4 kernel.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
