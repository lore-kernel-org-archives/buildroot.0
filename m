From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Sep 2020 11:42:04 +0200
Subject: [Buildroot] Toolchain issues on multiple architectures
In-Reply-To: <CAKmqyKN4Ge5YWUtbU-XwBD2JbrJ-jMhSVMZVbE6wOsz+CUM1jA@mail.gmail.com>
References: <20200910120536.2431494d@windsurf.hq.k.grp>
 <CAKmqyKOSLH-VJc-72eyn=O_-nNwneb3Wqcm-Yb1qt6TzXdDS0g@mail.gmail.com>
 <20200911093009.68a115f9@windsurf.hq.k.grp>
 <CAKmqyKN4Ge5YWUtbU-XwBD2JbrJ-jMhSVMZVbE6wOsz+CUM1jA@mail.gmail.com>
Message-ID: <20200924114204.7713bdfe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alistair,

On Fri, 11 Sep 2020 09:03:23 -0700
Alistair Francis <alistair23@gmail.com> wrote:

> > BR2_riscv=y
> > BR2_RISCV_32=y
> > BR2_KERNEL_HEADERS_5_4=y
> > BR2_BINUTILS_VERSION_2_34_X=y
> > BR2_GCC_VERSION_10_X=y
> > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
> > BR2_INIT_NONE=y
> > BR2_SYSTEM_BIN_SH_NONE=y
> > # BR2_PACKAGE_BUSYBOX is not set
> > BR2_PACKAGE_GDB=y
> > # BR2_TARGET_ROOTFS_TAR is not set  
> 
> I don't see any errors using this config with buildroot. Do I need to
> do anything else?

Sorry for the slow feedback. I retested the above defconfig, and it
fails to build here. Did you try on the 2020.08 tag, with no change ?
Perhaps you tried on master and something fixed this on master after
2020.08 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
