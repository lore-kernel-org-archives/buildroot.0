From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:32:23 +0100
Subject: [Buildroot] [PATCH] configs/udoo_quad_defconfig: new defconfig
In-Reply-To: <1422898611-30392-1-git-send-email-patrickdepinguin@gmail.com>
References: <1422898611-30392-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150202213223.79a4f96c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon,  2 Feb 2015 18:36:51 +0100, Thomas De Schampheleire wrote:

> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

These lines typically shouldn't be part of a minimal defconfig unless
there are really good reasons. So I removed them.

For beauty, I also added some silly comments in the defconfig, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
