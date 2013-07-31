From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 19:14:15 +0200
Subject: [Buildroot] List of pending patches: what to do?
Message-ID: <20130731191415.545f7dff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We currently have 228 pending patches in our patchwork at
http://patchwork.ozlabs.org/project/buildroot/list/. Many patches are
old and should be adopted to be cleaned up and resubmitted, or maybe
need to be rejected but after some community discussion.

In order to help reducing the backlog of patches, I'm pasting below the
entire list of patches with their title and direct link to patchwork.
What I'm interested in is people replying to this e-mail and giving
their opinion about some of the patches (don't try to look at all of
them, but at least a few of them). Opinions can be: we should reject,
I'm interested in adopting the patch and refreshing it, the patch is
interesting but needs this and that to be merged, etc.

Thanks for your help!

http://patchwork.ozlabs.org/patch/155498 New: add lava-test package
http://patchwork.ozlabs.org/patch/164551 [v3] busybox: install S41inetd and inetd.conf if inetd is enabled in busybox.
http://patchwork.ozlabs.org/patch/165382 [1/1] ccache: expose control interface via 'make ccache-options'
http://patchwork.ozlabs.org/patch/165542 [V2] p910nd: Add p910nd lightweight printserver
http://patchwork.ozlabs.org/patch/165674 [RFC,1/2] Add configuration item for custom JavaScript install path
http://patchwork.ozlabs.org/patch/165675 [RFC,2/2] Use JavaScript install path from configuration during package installation
http://patchwork.ozlabs.org/patch/171840 Added package v86d which provides a real-mode helper for uvesafb driver.
http://patchwork.ozlabs.org/patch/172024 Makefile: add variable print capabilities
http://patchwork.ozlabs.org/patch/172171 avahi: only install default.script/S05avahi-setup.sh if not present in fs skeleton
http://patchwork.ozlabs.org/patch/172278 pkg-infra: limit -reconfigure and -rebuild actions
http://patchwork.ozlabs.org/patch/172506 [01/11] libgpg-error: add optional nls support
http://patchwork.ozlabs.org/patch/173191 grub: fix stage2 link with recent binutils
http://patchwork.ozlabs.org/patch/173259 Added local package support.
http://patchwork.ozlabs.org/patch/176795 valgrind: valgrind/valgrind.h missing if --disable-tls enabled
http://patchwork.ozlabs.org/patch/176956 [2/2] rdiff-backup: new package
http://patchwork.ozlabs.org/patch/177618 [1/2,v4] package: pkg-generic: Support building override source without copying in common package infrastructure.
http://patchwork.ozlabs.org/patch/177705 grub: add host support
http://patchwork.ozlabs.org/patch/178526 syslinux: fix host build with newer Linux headers
http://patchwork.ozlabs.org/patch/179493 relative DL_DIR okay?
http://patchwork.ozlabs.org/patch/180241 Add support for the HABA-KNX-LITE
http://patchwork.ozlabs.org/patch/180285 upx: high-performance executable packer with in-place decompression support
http://patchwork.ozlabs.org/patch/180668 Add custom boards support for Atmel SAM-BA software
http://patchwork.ozlabs.org/patch/181185 linux: add default defconfig
http://patchwork.ozlabs.org/patch/181414 adding custom company packages
http://patchwork.ozlabs.org/patch/181503 [3/5] luajit: allow building for the host
http://patchwork.ozlabs.org/patch/181505 [5/5] lua: refactor without useless define's
http://patchwork.ozlabs.org/patch/181716 [1/2] Provide PAM default configuration files when building linux-pam package
http://patchwork.ozlabs.org/patch/181870 [1/9] firefox: host-python dependency needs --enable-unicodedata
http://patchwork.ozlabs.org/patch/181871 [2/9] firefox: valgrind dependency needs --enable-tls for debug build
http://patchwork.ozlabs.org/patch/181874 [3/9] firefox: sqlite dependency needs new compile-time options
http://patchwork.ozlabs.org/patch/181872 [4/9] firefox: installing default extensions needs host-xmlstarlet dependency
http://patchwork.ozlabs.org/patch/181875 [5/9] firefox: installing default extensions needs host-unzip dependency
http://patchwork.ozlabs.org/patch/181877 [6/9] firefox: Mozilla Web Browser
http://patchwork.ozlabs.org/patch/181876 [7/9] firefox: GNU gnash flash plugin needs agg dependency
http://patchwork.ozlabs.org/patch/181873 [8/9] firefox: GNU gnash flash plugin needs gconf dependency
http://patchwork.ozlabs.org/patch/181878 [9/9] firefox: GNU gnash flash, an open source Adobe Flash player & plugin
http://patchwork.ozlabs.org/patch/182233 Depend autotools targets on host-ccache when BR2_CCACHE is enabled.
http://patchwork.ozlabs.org/patch/182497 [1/4] If linux-pam is built, enable dbm functionality in Berkeley DB
http://patchwork.ozlabs.org/patch/182498 [2/4] Make Berkeley DB a dependency of linux-pam and make sure it is selected
http://patchwork.ozlabs.org/patch/182499 [3/4] Provide PAM default configuration files when building linux-pam package
http://patchwork.ozlabs.org/patch/182500 [4/4] PAM support in Busybox if linux-pam is built
http://patchwork.ozlabs.org/patch/182537 Fixing linux-pam build failures
http://patchwork.ozlabs.org/patch/182856 [RFC] patches-from-git.sh: new support script
http://patchwork.ozlabs.org/patch/185420 iucode-tool: new package
http://patchwork.ozlabs.org/patch/185422 Enables thread debugging with full gdb on target
http://patchwork.ozlabs.org/patch/185522 eaccelerator
http://patchwork.ozlabs.org/patch/186837 Add config for PHP eaccelerator package. Signed-off-by: Dallas Clement <dallas.a.clement@gmail.com>
http://patchwork.ozlabs.org/patch/186840 Added build configuration for Network UPS Tools (nut) package. Signed-off-by: Dallas Clement <dallas.a.clement@gmail.com>
http://patchwork.ozlabs.org/patch/187437 [3/3] mplayer: Fix DVD support
http://patchwork.ozlabs.org/patch/187775 pkg-infra: produce legal info for proprietary packages
http://patchwork.ozlabs.org/patch/187776 intel-microcode: new package
http://patchwork.ozlabs.org/patch/188525 Question about 64Bit kernel and 32Bit applications
http://patchwork.ozlabs.org/patch/188623 [1/2] Makefile: Fix target-purgelocales
http://patchwork.ozlabs.org/patch/188624 [2/2] Makefile: Add /usr/lib/locale to target-purgelocales
http://patchwork.ozlabs.org/patch/189336 libglib2: Fix midori save file dialog not being rendered
http://patchwork.ozlabs.org/patch/190922 autoconf version update 2.69 and patch rediff
http://patchwork.ozlabs.org/patch/190962 rpm5
http://patchwork.ozlabs.org/patch/191186 beecrypt: enable OpenMP if Buildroot GCC supports it
http://patchwork.ozlabs.org/patch/191204 putty: UNIX port of the famous Telnet and SSH GUI client
http://patchwork.ozlabs.org/patch/191300 gpsd: add patch to fix CPPFLAGS related build issue
http://patchwork.ozlabs.org/patch/191813 [RFC] grub2: new boot loader
http://patchwork.ozlabs.org/patch/193560 new pkg tor
http://patchwork.ozlabs.org/patch/195057 [PATCHv3] QtSerialPort: new package
http://patchwork.ozlabs.org/patch/195456 matchbox-desktop: Append -ldl to the linker
http://patchwork.ozlabs.org/patch/195476 package: add knxweb
http://patchwork.ozlabs.org/patch/196141 uClibc: install libc.so even if BR2_PREFER_STATIC_LIB is enabled
http://patchwork.ozlabs.org/patch/197028 lua: remove shared library feature
http://patchwork.ozlabs.org/patch/198013 perl: fix build
http://patchwork.ozlabs.org/patch/198127 automake version update 1.12.4
http://patchwork.ozlabs.org/patch/198133 libatomic_ops version update 7.3alpha2 old version 1.2 does not compiles with modern gcc and utils
http://patchwork.ozlabs.org/patch/198234 group file: define groups expected by udev
http://patchwork.ozlabs.org/patch/198555 [v2,5/6] cpanminus: requires host-qemu
http://patchwork.ozlabs.org/patch/198840 [1/1] mesa3d: build with host library with python support
http://patchwork.ozlabs.org/patch/199883 [07/10] libffi: make thread support optional
http://patchwork.ozlabs.org/patch/199891 busybox: needs linux-pam dependency added if using custom busybox .config & busybox login applet
http://patchwork.ozlabs.org/patch/200644 libevent: Add Gentoo patch for C libraries without the sysctl syscall
http://patchwork.ozlabs.org/patch/200889 [04/33] igh-ethercat: disable drivers build with kernel 3.6
http://patchwork.ozlabs.org/patch/200896 [05/33] imagemagick: explicitly disable c++ support if no c++ compiler available
http://patchwork.ozlabs.org/patch/200909 [20/33] pkg-download.mk: add tarball check in the wget method
http://patchwork.ozlabs.org/patch/201313 Passing arguments to the linker when external toolchain is used.
http://patchwork.ozlabs.org/patch/204176 [v2] luajit: complete replacement for lua
http://patchwork.ozlabs.org/patch/204481 Clean kernel when "make linux-clean" is called
http://patchwork.ozlabs.org/patch/204804 flite: new package
http://patchwork.ozlabs.org/patch/204806 libcanfestival: new package
http://patchwork.ozlabs.org/patch/207037 [RESEND,2/2] wpa_supplicant: rework .config file editing
http://patchwork.ozlabs.org/patch/207431 [4/4] gstreamer: replace gst-ffmpeg with gst-libav
http://patchwork.ozlabs.org/patch/207507 [1/2] dbus: bump dbus version from 1.4.24 to current 1.6.8
http://patchwork.ozlabs.org/patch/207508 [2/2] dbus: fix permissions of the installed launch helper
http://patchwork.ozlabs.org/patch/207548 Add a config override file capability.
http://patchwork.ozlabs.org/patch/207717 dtb: provide option to install dtb to boot directory
http://patchwork.ozlabs.org/patch/207827 tokyocabinet: new package
http://patchwork.ozlabs.org/patch/207942 [RFC,1/2] barebox: Build barebox in separate directory.
http://patchwork.ozlabs.org/patch/207943 [RFC,2/2] barebox: Add possibility to build also barebox xloader (MLO).
http://patchwork.ozlabs.org/patch/207947 new package: p7zip
http://patchwork.ozlabs.org/patch/207978 toolchain-external: re-introduce Sourcery CodeBench ARM 2010.09
http://patchwork.ozlabs.org/patch/208152 [v3] usbip: new package
http://patchwork.ozlabs.org/patch/208350 [v2,2/2] rxvt-unicode: new package
http://patchwork.ozlabs.org/patch/208680 [v2] mesa3d: bumped to 8.0.5
http://patchwork.ozlabs.org/patch/208801 [3/8] package/Makefile.in: update/fix HOST_PATH variable
http://patchwork.ozlabs.org/patch/208802 [4/8] package/pkg-cmake.mk: make sure $(HOST_PATH) is in the PATH at configure time
http://patchwork.ozlabs.org/patch/208803 [5/8] dependencies: build a host python2 if no suitable one can be found
http://patchwork.ozlabs.org/patch/208804 [6/8] scons: add host-python2-if-needed dependency
http://patchwork.ozlabs.org/patch/208805 [7/8] scons: ensure $(HOST_DIR)/usr/bin is in the PATH when invoking $(SCONS)
http://patchwork.ozlabs.org/patch/208806 [8/8] manual: add host python2 dependency section
http://patchwork.ozlabs.org/patch/211644 [1/1,v2] Hide issue and hostname menu when using a custom skeleton.
http://patchwork.ozlabs.org/patch/212498 [1/2] new package: python-posix_ipc.
http://patchwork.ozlabs.org/patch/212499 [2/2] new package: python-posix_ipc
http://patchwork.ozlabs.org/patch/212500 [1/1] added python unicode selection to menu
http://patchwork.ozlabs.org/patch/213112 [1/2] makebootfat: new package
http://patchwork.ozlabs.org/patch/213113 [2/2] Basic filesystem image with partition table support
http://patchwork.ozlabs.org/patch/213230 Update dmraid from 1.0.0-rc15 to 1.0.0-rc16-3.
http://patchwork.ozlabs.org/patch/213384 [RFC] Fix avr32 build using internal toolchain
http://patchwork.ozlabs.org/patch/214943 [1/1] Documentation update : add tips to build manual, add information about buildroot toolchain not being relocable and put some hints to use it, move the Beyond Buildroot section before FAQs and add content
http://patchwork.ozlabs.org/patch/215631 Problem using Linux kernel archive from Gitorious
http://patchwork.ozlabs.org/patch/216485 Docu: Add LIBFOO_EXTRACT_CMDS
http://patchwork.ozlabs.org/patch/217204 Linux: enable local Linux tarball in config
http://patchwork.ozlabs.org/patch/217639 minimal dockstar setup
http://patchwork.ozlabs.org/patch/218109 scripts: xorg-release: handle case when version needs downgrade
http://patchwork.ozlabs.org/patch/218928 [v2] configs: at91sam9260eknf: new configuration for Atmel AT91SAM9260-EK
http://patchwork.ozlabs.org/patch/219795 lxc: new package
http://patchwork.ozlabs.org/patch/220024 [1/1] python: fix to ensure libpython is stripped
http://patchwork.ozlabs.org/patch/220542 package: add the duma memory debugging library
http://patchwork.ozlabs.org/patch/220706 [v4,1/5] Python menu reorganization
http://patchwork.ozlabs.org/patch/220707 [v4,2/5] Add python3 config directory simlink
http://patchwork.ozlabs.org/patch/220705 [v4,3/5] Add PYTHON variable to ease the support of both version
http://patchwork.ozlabs.org/patch/220708 [v4,4/5] python-bottle: Convert package to be used with python2 or python3
http://patchwork.ozlabs.org/patch/220709 [v4,5/5] python-serial: Convert package to be used with python2 or python3
http://patchwork.ozlabs.org/patch/220720 Using external toolchain wrapper outside of buildroot
http://patchwork.ozlabs.org/patch/220844 new package: adns
http://patchwork.ozlabs.org/patch/220849 new package: mlocate
http://patchwork.ozlabs.org/patch/221062 xlib_libpthread-stubs: needs -pthread when linking statically
http://patchwork.ozlabs.org/patch/221076 new package: iso-codes
http://patchwork.ozlabs.org/patch/221084 Adding a ModemManager package
http://patchwork.ozlabs.org/patch/222133 [1/1] forward a patch (powerpc) from uClibc 0.9.32.1 to 0.9.33.2
http://patchwork.ozlabs.org/patch/222384 polkit: bump to version 0.104
http://patchwork.ozlabs.org/patch/222743 [v3] Added local directory as soure of kernel code
http://patchwork.ozlabs.org/patch/224477 [Bug,6014] New: Building rootfs stops at copying device table when not using static tables
http://patchwork.ozlabs.org/patch/224479 [2/3] cpanminus: works with arm & mips
http://patchwork.ozlabs.org/patch/224541 [1/1] Updated systemd to version 197
http://patchwork.ozlabs.org/patch/225752 [v3,1/3] lua: remove built dependencies
http://patchwork.ozlabs.org/patch/225754 [v3,2/3] luainterpreter: create virtual package
http://patchwork.ozlabs.org/patch/225753 [v3,3/3] luajit: allow to build Lua extensions without lua
http://patchwork.ozlabs.org/patch/225799 change default location for local.mk to $(CONFIG_DIR)
http://patchwork.ozlabs.org/patch/226374 [4/5] libglib2: fix noMMU build
http://patchwork.ozlabs.org/patch/228809 [3/3] prcpucfg fixes for nspr aarch64
http://patchwork.ozlabs.org/patch/229620 new patch model improvements
http://patchwork.ozlabs.org/patch/230289 [v2] Enable ccache for cmake packages
http://patchwork.ozlabs.org/patch/230733 [4/4] Enable feature CONFIG_FEATURE_PIDFILE so that the syslog initscript actually works
http://patchwork.ozlabs.org/patch/231856 Install DTB as part of images install command
http://patchwork.ozlabs.org/patch/232024 [1/1] manual: add patch revision and versioning section
http://patchwork.ozlabs.org/patch/232077 [1/1] Fix the syslogd initscript pidfile handling - Fix name to pidfile - Enable CONFIG_FEATURE_PIDFILE
http://patchwork.ozlabs.org/patch/233131 pkg-download: take some more care of <PKG_>VERSION when METHOD is git
http://patchwork.ozlabs.org/patch/234527 [2/2] arch: remove support for SuperH 2 and SuperH 3
http://patchwork.ozlabs.org/patch/236409 udev: fix avr32 and microblaze build failures
http://patchwork.ozlabs.org/patch/236467 Extending buildroot functionality for creating board support packages (BSP) out of buildroot tree
http://patchwork.ozlabs.org/patch/236845 Problem with external toolchain sysroot and eclipse
http://patchwork.ozlabs.org/patch/237208 [RFC] BR2_KERNEL_HEADERS_TARGET: Add support for using target kernel for toolchain kernel headers.
http://patchwork.ozlabs.org/patch/237887 package: add toolchain dependency to inner-generic-package
http://patchwork.ozlabs.org/patch/238366 [RFC] permit menu customization
http://patchwork.ozlabs.org/patch/240358 Add package subversion
http://patchwork.ozlabs.org/patch/241102 linux: Fix User-Mode Linux build failures
http://patchwork.ozlabs.org/patch/241250 toolchain/gcc: Introduce BR2_ARCH_HAS_GCC_x_y_PLUS
http://patchwork.ozlabs.org/patch/241511 [1/1] ser2net: add default init script
http://patchwork.ozlabs.org/patch/242998 [1/2] rpi: improve documentation
http://patchwork.ozlabs.org/patch/242999 [2/2] rpi: rename board folder for consistency
http://patchwork.ozlabs.org/patch/243426 Fix bug with dependencies of *-rebuild and *-reconfigure
http://patchwork.ozlabs.org/patch/243427 [v2] Add support for plain URL in $(PKG)_PATCH variable
http://patchwork.ozlabs.org/patch/243442 [1/6] package infra: remove CPPFLAGS from CFLAGS
http://patchwork.ozlabs.org/patch/243445 [4/6] libcurl: bump to version 7.30.0
http://patchwork.ozlabs.org/patch/243649 Using Buildroot tool chain as external Toolchain
http://patchwork.ozlabs.org/patch/243725 Standardisation of $(BUILD)/.root name
http://patchwork.ozlabs.org/patch/244200 [2/3] fs: add uimage support w/ example for cpio
http://patchwork.ozlabs.org/patch/244201 [3/3] zedboard: add Avnet Zedboard support.
http://patchwork.ozlabs.org/patch/244409 [1/1] libtirpc: requires toolchain with threads support
http://patchwork.ozlabs.org/patch/244694 Makefile: Set default emulation for MIPS64/MIPS64el n64
http://patchwork.ozlabs.org/patch/245030 [10/12] luasec: New package
http://patchwork.ozlabs.org/patch/245031 [11/12] luasql: New package
http://patchwork.ozlabs.org/patch/245032 [12/12] orbit: New package
http://patchwork.ozlabs.org/patch/245241 [1/1] skeleton: add default login port to /etc/securetty
http://patchwork.ozlabs.org/patch/245242 [1/1] buildroot: Add POST_RSYNC_HOOKS support
http://patchwork.ozlabs.org/patch/246622 Shared libraries permissions prevent stripping
http://patchwork.ozlabs.org/patch/247051 Makefile: add variable print capabilities
http://patchwork.ozlabs.org/patch/247610 Makefile: defconfig: use BR2_DEFCONFIG only when the file exists
http://patchwork.ozlabs.org/patch/249635 UCLIBC_EXTRA_CFLAGS in uClibc overridden while using buildroot
http://patchwork.ozlabs.org/patch/249721 [PATCHv2] linux: Fix uImage with appended DTs generation
http://patchwork.ozlabs.org/patch/249855 UCLIBC_EXTRA_CFLAGS in uClibc overridden while using buildroot
http://patchwork.ozlabs.org/patch/249912 Makefile: change rsync used in overlays to always transfer files
http://patchwork.ozlabs.org/patch/252718 Unstripped binaries for debugging with gdbserver
http://patchwork.ozlabs.org/patch/253095 [v12,10/11] libav: add new package
http://patchwork.ozlabs.org/patch/253093 [v12,11/11] gst-libav: add libav plugin for gtreamer 1.x
http://patchwork.ozlabs.org/patch/253208 [1/1] "Change package tarball compression to xz"
http://patchwork.ozlabs.org/patch/253944 [1/1] Add package ola (open lighting architecture)
http://patchwork.ozlabs.org/patch/255486 ldconfig - unknown machine 40
http://patchwork.ozlabs.org/patch/255697 dhcpcd: unavailable for bfin and fix another bug
http://patchwork.ozlabs.org/patch/256303 system: only set the root password if it's not empty
http://patchwork.ozlabs.org/patch/256630 [v2] Makefile: Symlink lib32 to lib for MIPS64/n32
http://patchwork.ozlabs.org/patch/256744 tar: avoid ccache chicken and egg problem when bootstrapping tar
http://patchwork.ozlabs.org/patch/256768 system: add config item to set root password or not
http://patchwork.ozlabs.org/patch/257372 [1/3] infra: make possible to run 'make *-menuconfig' from a clean output dir
http://patchwork.ozlabs.org/patch/257374 [2/3] crosstool-ng: remove unneed explicit ccache dependency
http://patchwork.ozlabs.org/patch/257375 [3/3] sstrip: remove unneed explicit ccache dependency
http://patchwork.ozlabs.org/patch/257376 [1/3] qt{4, 5}: add an explicit choice to express Buildroot does not support their coexistence
http://patchwork.ozlabs.org/patch/257377 [2/3] manual: add faq entry explaining why Buildroot does not support Qt{4, 5} coexistence
http://patchwork.ozlabs.org/patch/257378 [3/3] opencv: bump version to 2.4.6
http://patchwork.ozlabs.org/patch/257846 [v2,1/2] linux: install firmware to staging.
http://patchwork.ozlabs.org/patch/257847 [v2,2/2] beagle-capes: new package
http://patchwork.ozlabs.org/patch/257987 Raspberry Pi SD-Card flasher script
http://patchwork.ozlabs.org/patch/258457 gcc: provide an option to enable mudflap support
http://patchwork.ozlabs.org/patch/258467 toolchain-internal: skip gcc-intermediate when possible
http://patchwork.ozlabs.org/patch/258698 Raspberry Pi - WiringPi Library Package
http://patchwork.ozlabs.org/patch/258723 toolchain: Add BR2_TOOLCHAIN_HAS_THREADS_NATIVE
http://patchwork.ozlabs.org/patch/260246 xzcat: treat as host prerequisite and build if needed
http://patchwork.ozlabs.org/patch/260435 [1/3] python-setuptools: bumped version to 0.8
http://patchwork.ozlabs.org/patch/260436 [2/3] python: added hidden openssl option to host python
http://patchwork.ozlabs.org/patch/260437 [3/3] python-pip: new package
http://patchwork.ozlabs.org/patch/261296 [1,of,6,v2] Config.in.legacy: update description
http://patchwork.ozlabs.org/patch/261297 [2,of,6,v2] linux: don't take HEAD as default for git repositories
http://patchwork.ozlabs.org/patch/261298 [3,of,6,v2] linux: add support for custom Mercurial repository
http://patchwork.ozlabs.org/patch/261299 [4,of,6,v2] u-boot: add support for custom Mercurial repository
http://patchwork.ozlabs.org/patch/261300 [5,of,6,v2] linux/uboot: line-up repository-related configuration options
http://patchwork.ozlabs.org/patch/261301 [6,of,6,v2] linux: mention 3.x.y kernels in 'custom version' help
http://patchwork.ozlabs.org/patch/262565 [v2,1/1] Change package tarball compression to xz whenever possible
http://patchwork.ozlabs.org/patch/262692 [v3] <pkg>-rsync: support user custom cmds
http://patchwork.ozlabs.org/patch/262971 directfb-lua: new package
http://patchwork.ozlabs.org/patch/263385 pacakge : add trace-cmd package
http://patchwork.ozlabs.org/patch/263444 toolchain-external: don't create gdb symlink when building host-gdb
http://patchwork.ozlabs.org/patch/263761 [v2] Fix building initramfs kernel with appended dtb
http://patchwork.ozlabs.org/patch/263767 libedit: really needs wchar support

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
