From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 23:53:53 +0200
Subject: [Buildroot] Proposal to remove patches from patchwork,
	or find adopters
Message-ID: <20150506235353.7740a9d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On April 21th, I sent a personal reminder to all the patch authors who
had patches older than 15 days pending in Buildroot's patchwork.

Since then, a number of authors have responded to indicate whether they
are still interested or not by their patches, which is great.

However, a fairly significant portion of the patches have not been
given any feedback by their respective authors. I have triaged the
answers from the authors, and classified such patches. The list of such
patches follows. Note that the authors of such patches are again added
in the To: field of this e-mail, to get their attention.

I hereby propose to mark all those patches as "Rejected" on May 21 (i.e
one month after the reminder), if the authors still haven't expressed
interest and nobody else volunteered to adopt the patch. I believe we
can't keep for months or years patches that the original author has
lost interest in, and nobody else seems to be interested in.

Let me know if you agree or disagree with this proposal.

Volunteers interested in adopting one or several of the below patches,
please speak up.

Here is the list of such patches:

 * [1/2] Makefile: Fix target-purgelocales
 * [RFC,2/2] barebox: Add possibility to build also barebox xloader (MLO).
 * [1/3] ccache: change compilercheck to use compiler and toolchain info
 * [v3,5/5] board: add support for the Fri2 board
 * [v7,1/2] adding bootloader option for iso9660 filesystem image
 * [v7,2/2] add bootloader isolinux for iso9660 filesystem image
 * [v2] Add Marble package.
 * [v1] Python script to check package version
 * socfpga-cyclone5 Dev board support
 * Reduce need for BR2_HOSTARCH_NEEDS_IA32_COMPILER
 * [6/7,v3] package/petitboot: Add petitboot, the userspace bootloader
 * [7/7,v3] Add powerpc64 petitboot defconfig
 * [1/1] libssh2: fix library search path issues when zlib support enabled
 * [RFC] Separate target-building make targets from image-building make targets
 * [2/2] ntp: prevent keyword-gen failure during ntp_keyword.h check
 * [lua,V4,4/4] lua-iconv: new package
 * [1/1] ti-wl12xx_target_scripts: new package
 * [v2] wpa_supplicant: Add NL80211 support option
 * [v2] qt: add gst-plugins-base dependency to multimedia module
 * [1/1] toybox: new package
 * Fix selection of bootloaders from $(BR2_EXTERNAL)
 * [RFC/PATCH] linux: remove the zImage before rebuild
 * [v3] autobuilder: branch support
 * [1/1] Fix nfs server for a read only rootfs
 * RFC: [PATCH 1/1] check-updates.py: Adds CVE check
 * [v3] uboot-tools: Allow users to use uboot's sources
 * [1/2] Use package framework to manage skeleton
 * [2/2] Change deps between $(TARGET_DIRS) and rootfs-dirs
 * [50/51] protobuf-c: bump version
 * [51/51] protobuf: bump version
 * wireshark: remove RPATH tag
 * [V3,4/5] c-icap: new package
 * [V3,5/5] c-icap-modules: new package
 * [v2,1/4] libfm-extra: new package
 * [v2,2/4] menu-cache: new package
 * [v2,3/4] libfm: new package
 * [v2,4/4] pcmanfm: bump version to 1.2.3
 * [v4,1/9] Makefile: don't depend on the umask
 * [v4,2/9] Makefile: don't depend on current skeleton/overlay permissions
 * [v4,3/9] toolchain/helpers.mk: use --chmod on rsync
 * [v4,4/9] pkg-generic.mk: don't depend on external package permissions
 * [v4,6/9] scripts: mkmakefile: set umask before calling BR's makefile
 * [1/1] Fix npm module cross compilation, use up-to-date npm and install modules globally
 * [1/1] package/iojs: new package
 * spidev_test: use the one from the kernel we build
 * [1/3] fs/iso9660: allow building a hybrid ISO image
 * [3/3] docs/manual/beyond-buildroot: building and testing live-CDs
 * [RFC,3/4] opengl-registry: Also provide DRI interface
 * [RFC,4/4] xorg-server: Depends on libgl to enable DRI/GLX
 * [v2,2/2] python-jinja2: allow build as host-package
 * [1/1] qt5base: add option for custom qconfig file
 * [1/2,RFC] LLVM: Added package
 * [2/2,RFC] mesa3d: Use LLVM as the shader compiler when applicable
 * [PATCHv3,for,next,1/2] toolchain-external: improve lib subdirectory matching
 * [PATCHv3,for,next,2/2] toolchain: create symlink to 'lib' from ARCH_LIB_DIR iso fixed lib32/lib64
 * xc3sprog: new package
 * [1/1] package/x11r7/xapp_xfs: Fix linking error
 * linux: adjust fixup logic for ktap
 * gettext: add dependency on host-libxml2 for host-gettext.
 * [2/2] fs: add custom fakeroot script support
 * [1/1] Added package gmock
 * [1/1] package/systemd: journald should use volatile storage
 * [1/1] gmock: new package
 * [1/1] bash: added option to disable locale support
 * [v2,1/1] Makefile: add target to clean targetfs
 * [v2,1/1] board: add support for Xilinx zc706
 * [v2] busybox: add option for standalone telnetd on target
 * toolchain-external: fix gdbserver copying for ARC GNU tools
 * [2/2] bfin: put the libc link path of the flat shared and sep data formats before the sysroot link path
 * [RFC,v2,1/5] aarch64: add big endian(aarch64_be) support
 * [RFC,v2,2/5] aarch64: ilp32: handle special file name
 * [RFC,v2,3/5] aarch64: ilp32: add ilp32 compiler and linker flags
 * [RFC,v2,4/5] aarch64: ilp32: add ilp32 build config
 * [RFC,v2,5/5] aarch64: ilp32 defconfig examples
 * [1/1] busybox: add conditional dependency on libselinux (v2)

Thanks,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
