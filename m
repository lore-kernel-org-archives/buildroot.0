From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Dec 2010 21:25:31 +0100
Subject: [Buildroot] [PATCH] support for mini initramfs and added
 iso9660 improvements
In-Reply-To: <c3e09387f2f59a61e096cd974d8921fb6fa9ea43.1291562435.git.smiley73@users.sourceforge.net>
References: <c3e09387f2f59a61e096cd974d8921fb6fa9ea43.1291562435.git.smiley73@users.sourceforge.net>
Message-ID: <20101205212531.1a1c5978@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko,

On Sun,  5 Dec 2010 09:23:03 -0600
heiko at zuerker.org wrote:

> -config BR2_TARGET_MINIMAL_INITRAMFS
> +config BR2_TARGET_ROOTFS_MINI_INITRAMFS

Something must be wrong in your patch, because it removes
BR2_TARGET_MINIMAL_INITRAMFS, but this option does not exist in the
current Buildroot.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
