From: Yu-Ting, Kao <jackzzjack@gmail.com>
Date: Mon, 26 Dec 2016 22:32:37 +0800
Subject: [Buildroot] Autobuild reproduction and generation
In-Reply-To: <20161226101659.57238bc6@free-electrons.com>
References: <CADZ=QZ=SU7XthdVfaAQpeY7LKJcsOME1zOusWvZAEjs0OpRfZw@mail.gmail.com>
 <20161226092127.1c4a40d1@free-electrons.com>
 <CADZ=QZnpVmC_hKqSMFehhdO_m9pZsK0OBcfVd4hXsbvjV==A1g@mail.gmail.com>
 <20161226101659.57238bc6@free-electrons.com>
Message-ID: <CADZ=QZ=uJ-5T+d-f5RJK3uv+paCyCCFA0ihwvSHrhTT45n1Fpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have another problem and it appears many times on many autobuild issue
IDs.


The error log at below.
--------------------------------------------------------------------------------------------------------------------

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

remote: Counting objects: 129, done.
remote: Compressing objects: 100% (75/75), done.
remote: Total 129 (delta 89), reused 78 (delta 54)
Receiving objects: 100% (129/129), 22.50 KiB | 0 bytes/s, done.
Resolving deltas: 100% (89/89), completed with 29 local objects.
From git://git.busybox.net/buildroot
 * [new branch]          2012.11.x  -> origin/2012.11.x
 * [new branch]          2013.08.x  -> origin/2013.08.x
 * [new branch]          2015.08.x  -> origin/2015.08.x
 * [new branch]          2015.11.x  -> origin/2015.11.x
 * [new branch]          2016.08.x  -> origin/2016.08.x
 * [new branch]          2016.11.x  -> origin/2016.11.x
   320d73ab1..a1914921e  master     -> origin/master
 * [new branch]          next       -> origin/next
HEAD is now at a1914921e... collectd: fix option passed to the snmp
dependency
/usr/bin/make -j1
O=/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output
HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" silentoldconfig
mkdir -p
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/lxdialog
PKG_CONFIG_PATH="" /usr/bin/make CC="/usr/bin/gcc" HOSTCC="/usr/bin/gcc" \

obj=/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config
-C support/kconfig -f Makefile.br conf
/usr/bin/gcc -D_GNU_SOURCE -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -I/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config
-DCONFIG_=\"\"  -MM *.c >
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/.depend
2>/dev/null || :
/usr/bin/gcc -D_GNU_SOURCE -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -I/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config
-DCONFIG_=\"\"   -c conf.c -o
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/conf.o
/usr/bin/gcc -D_GNU_SOURCE -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -I/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config
-DCONFIG_=\"\"  -I. -c
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/zconf.tab.c
-o
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/zconf.tab.o
/usr/bin/gcc -D_GNU_SOURCE -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -I/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config
-DCONFIG_=\"\"
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/conf.o
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/zconf.tab.o
 -o
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/conf
rm
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/zconf.tab.c
  GEN
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/Makefile
BR2_DEFCONFIG=''
KCONFIG_AUTOCONFIG=/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/autoconf.h
KCONFIG_TRISTATE=/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/tristate.config
BR2_CONFIG=/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/.config
HOST_GCC_VERSION="5"
BUILD_DIR=/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build
SKIP_LEGACY=
/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/conf
--silentoldconfig Config.in
*
* Restart config...
*
*
* Build options
*
Location to save buildroot config (BR2_DEFCONFIG) [$(CONFIG_DIR)/defconfig]
$(CONFIG_DIR)/defconfig
Download dir (BR2_DL_DIR) [$(TOPDIR)/dl] $(TOPDIR)/dl
Host dir (BR2_HOST_DIR) [$(BASE_DIR)/host] $(BASE_DIR)/host
Number of jobs to run simultaneously (0 for auto) (BR2_JLEVEL) [0] 0
Enable compiler cache (BR2_CCACHE) [N/y/?] n
build packages with debugging symbols (BR2_ENABLE_DEBUG) [N/y/?] n
strip command for binaries on target
> 1. strip (BR2_STRIP_strip)
  2. none (BR2_STRIP_none)
choice[1-2]: 1
executables that should not be stripped (BR2_STRIP_EXCLUDE_FILES) []
directories that should be skipped when stripping (BR2_STRIP_EXCLUDE_DIRS)
[]
gcc optimization level
  1. optimization level 0 (BR2_OPTIMIZE_0)
  2. optimization level 1 (BR2_OPTIMIZE_1)
  3. optimization level 2 (BR2_OPTIMIZE_2)
  4. optimization level 3 (BR2_OPTIMIZE_3)
  5. optimize for debugging (BR2_OPTIMIZE_G)
> 6. optimize for size (BR2_OPTIMIZE_S)
choice[1-6?]: 6
Enable google-breakpad support (BR2_GOOGLE_BREAKPAD_ENABLE) [N/y/?] (NEW)
aborted!

Console input/output is redirected. Run 'make oldconfig' to update
configuration.

Makefile:882: recipe for target 'silentoldconfig' failed
make[2]: *** [silentoldconfig] Error 1
Makefile:538: recipe for target
'/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/auto.conf'
failed
make[1]: ***
[/home/kao23/buildroot-contri/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/auto.conf]
Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

2016-12-26 17:16 GMT+08:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Mon, 26 Dec 2016 17:07:08 +0800, Yu-Ting, Kao wrote:
>
> > 2016-12-26 16:52:22 (997 KB/s) -
> > ?/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0
> 048e77c21f/output/build/.br-i386-pentium4-full-2016.11-
> 236-ge309abf.tar.bz2.UewivN/output?
> > saved [44346526/44346526]
> >
> > WARNING: no hash file for br-i386-pentium4-full-2016.11-
> 236-ge309abf.tar.bz2
> > >>> toolchain-external-custom  Extracting
> > bzcat
> > /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0
> 048e77c21f/buildroot/dl/br-i386-pentium4-full-2016.11-236-ge309abf.tar.bz2
> > | tar --strip-components=1 -C
> > /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0
> 048e77c21f/output/build/toolchain-external-custom
> > --exclude='usr/lib/locale/*'   -xf -
> > rm -rf
> > /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0
> 048e77c21f/output/host/opt/ext-toolchain
> > mkdir -p
> > /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0
> 048e77c21f/output/host/opt/ext-toolchain
> > mv
> > /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0
> 048e77c21f/output/build/toolchain-external-custom/*
> > /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0
> 048e77c21f/output/host/opt/ext-toolchain/
> > >>> toolchain-external-custom  Patching
> > >>> toolchain-external-custom  Configuring
> > Cannot execute cross-compiler
> > '/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0
> 048e77c21f/output/host/opt/ext-toolchain/bin/i686-linux-gcc.br_real'
> > make[1]: ***
> > [/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0
> 048e77c21f/output/build/toolchain-external-custom/.stamp_configured]
> > Error 1
> > make: *** [_all] Error 2
>
> This one is because for some reason the pre-built toolchain doesn't
> work for you. Please
> run ./output/host/opt/ext-toolchain/bin/i686-linux-gcc manually to see
> what is the error message.
>
> > 7. Sometimes may show
> >
> > ------------------------------------------------------------
> ----------------------------------------
> >
> > --2016-12-26 16:59:07--
> > http://autobuild.buildroot.org/results/358/
> 358e2f02f42e08fe362ecd46e636c0048e77c21f//gitid
> > Resolving autobuild.buildroot.org (autobuild.buildroot.org)...
> 94.23.254.152
> > Connecting to autobuild.buildroot.org
> > (autobuild.buildroot.org)|94.23.254.152|:80...
> > connected.
> > HTTP request sent, awaiting response... 200 OK
> > Length: 40 [text/plain]
> > Saving to:
> > ?/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f//gitid?
> >
> > 100%[=======================================================
> ==================>]
> > 40          --.-K/s   in 0s
> >
> > 2016-12-26 16:59:08 (1.59 MB/s) -
> > ?/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f//gitid?
> saved
> > [40/40]
> >
> > fatal: destination path 'buildroot' already exists and is not an empty
> > directory.
> > Cannot clone Buildroot Git repository
>
> You have already tried to build this same build id, so Buildroot has
> already been cloned. The script is not prepared for that, it assumes
> you build only once a given build id. If you want to build it two time,
> you are supposed to
> remove /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/
> between the two builds.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161226/5c2bc847/attachment.html>
