From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Nov 2015 21:31:19 +0000 (UTC)
Subject: [Buildroot] [Bug 8491] libglib2 2.46.1 not Building for armv5 on
	2015.11-rc3
In-Reply-To: <bug-8491-163@https.bugs.busybox.net/>
References: <bug-8491-163@https.bugs.busybox.net/>
Message-ID: <20151129213119.51C9F7FA9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8491

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-11-29 21:31:18 UTC ---
Hello,

Thanks for your report!

However, I can not reproduce that build failure.
Here's my defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBGLIB2=y

This selects an arm926t CPU, which is an armv5. And libglib2
builds correctly here.

Care to share your defconfig, please?

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
