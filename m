From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 16:59:12 +0100
Subject: [Buildroot] About the "for-peter-2013.11" branch
Message-ID: <20131102165912.2ca8a0d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As you have noticed, I've accumulated many of the pending patches doing
minor improvements or fixes into a branch called "for-peter-2013.11".

Peter is on holidays until Monday, and in his absence, I thought it
would be a good idea to gather all those changes to make it easier from
him to get all of them when he comes back.

I'm only taking patches that I'm almost 100% sure Peter will accept, so
that I can mark the corresponding patches as "Accepted" in Patchwork.

The for-peter-2013.11 branch can be found at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=for-peter-2013.11

Do not hesitate to let me know if you think other fixes should be
integrated on this branch.

At the time of this writing, it contains the following patches:

* git packages: use full revision hash
* manual: github commits should be specified in full
* uboot-tools: fix license issues
* rsync: use system zlib and popt, also do not lose debug options
* manual: customize-toolchain.txt: update internal backend section
* manual: developer-guide.txt: cleanup non-existing source
* support: trivial fixes (typos and minor rewording) in gen-manual-lists.py
* manual generation: rename manual-txt into manual-text
* manual generation: check dependencies first
* cppzmq/czmq: Update comment for needs threads support
* sysvinit: install new cmds and fix inittab
* xenomai: use install-user to remove patch
* uemacs: fix package source
* Config.in files: add/update comments on (e)glibc dependencies
* strongswan: add security patches
* util-linux: Add --without-ncurses to host-util-linux
* ebtables: build fix for 64-bit kernel with 32-bit userland
* arch/Config.in: introduce BR2_KERNEL_64_USERLAND_32 symbol
* pkgconf: fix upstream URL
* libcgroup: also needs host-flex
* cjson: link with libm, unavailable for static
* trace-cmd: fix ptrace detection
* glibc, toolchain-external: copy libthread_db when gdb is enabled
* toolchain-external: fix visibility and length of Linaro toolchain comment
* toolchain-external: add missing symlink for Linaro toolchains
* support/kconfig: fix compile warning because of missing include.
* ext-toolchain: MIPS: Select correct endianness for the target
* valgrind: add support for glibc 2.17 and 2.18
* arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
