From: Yu-Ting, Kao <jackzzjack@gmail.com>
Date: Tue, 27 Dec 2016 09:57:03 +0800
Subject: [Buildroot] Autobuild reproduction and generation
In-Reply-To: <20161226153935.54390a45@free-electrons.com>
References: <CADZ=QZ=SU7XthdVfaAQpeY7LKJcsOME1zOusWvZAEjs0OpRfZw@mail.gmail.com>
 <20161226092127.1c4a40d1@free-electrons.com>
 <CADZ=QZnpVmC_hKqSMFehhdO_m9pZsK0OBcfVd4hXsbvjV==A1g@mail.gmail.com>
 <20161226101659.57238bc6@free-electrons.com>
 <CADZ=QZ=uJ-5T+d-f5RJK3uv+paCyCCFA0ihwvSHrhTT45n1Fpw@mail.gmail.com>
 <20161226153935.54390a45@free-electrons.com>
Message-ID: <CADZ=QZ=5gbMyM0nVCb92+FuZn-WVpJDfMLNpNCm=suC-O8PmPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I checked the 99381d37002db28566d1aba257418a38c9edee39 directory is deleted.

the error log at below
----------------------------------------------------------------------------------------------------------------------

> ./br-reproduce-build 99381d37002db28566d1aba257418a38c9edee39
--2016-12-27 09:53:24--
http://autobuild.buildroot.org/results/993/99381d37002db28566d1aba257418a38c9edee39/config
Resolving autobuild.buildroot.org (autobuild.buildroot.org)... 94.23.254.152
Connecting to autobuild.buildroot.org
(autobuild.buildroot.org)|94.23.254.152|:80...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 69588 (68K) [text/plain]
Saving to:
?/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/config?

100%[=========================================================================>]
69,588      80.9KB/s   in 0.8s

2016-12-27 09:53:26 (80.9 KB/s) -
?/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/config? saved
[69588/69588]

--2016-12-27 09:53:26--
http://autobuild.buildroot.org/results/993/99381d37002db28566d1aba257418a38c9edee39/gitid
Resolving autobuild.buildroot.org (autobuild.buildroot.org)... 94.23.254.152
Connecting to autobuild.buildroot.org
(autobuild.buildroot.org)|94.23.254.152|:80...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 40 [text/plain]
Saving to:
?/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/gitid?

100%[=========================================================================>]
40          --.-K/s   in 0s

2016-12-27 09:53:27 (534 KB/s) -
?/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/gitid? saved
[40/40]

Cloning into 'buildroot'...
done.
Checking out files: 100% (8828/8828), done.
remote: Counting objects: 263, done.
remote: Compressing objects: 100% (209/209), done.
remote: Total 263 (delta 182), reused 78 (delta 54)
Receiving objects: 100% (263/263), 49.65 KiB | 88.00 KiB/s, done.
Resolving deltas: 100% (182/182), completed with 40 local objects.
From git://git.busybox.net/buildroot
   3eddce6..a191492  master     -> origin/master
 * [new branch]      2012.11.x  -> origin/2012.11.x
 * [new branch]      2013.08.x  -> origin/2013.08.x
 * [new branch]      2015.08.x  -> origin/2015.08.x
 * [new branch]      2015.11.x  -> origin/2015.11.x
 * [new branch]      2016.08.x  -> origin/2016.08.x
 * [new branch]      2016.11.x  -> origin/2016.11.x
 * [new branch]      next       -> origin/next
Note: checking out 'a1914921ebc3c5d5720d7249e3dc2e5d030471f4'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at a191492... collectd: fix option passed to the snmp dependency
/usr/bin/make -j1
O=/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output
HOSTCC="/usr/lib/ccache/gcc" HOSTCXX="/usr/lib/ccache/g++" silentoldconfig
mkdir -p
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/lxdialog
PKG_CONFIG_PATH="" /usr/bin/make CC="/usr/lib/ccache/gcc"
HOSTCC="/usr/lib/ccache/gcc" \

obj=/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config
-C support/kconfig -f Makefile.br conf
/usr/lib/ccache/gcc -I/usr/include/ncursesw   -DCURSES_LOC="<ncurses.h>"
-DNCURSES_WIDECHAR=1 -DLOCALE
 -I/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config
-DCONFIG_=\"\"  -MM *.c >
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/.depend
2>/dev/null || :
/usr/lib/ccache/gcc -I/usr/include/ncursesw   -DCURSES_LOC="<ncurses.h>"
-DNCURSES_WIDECHAR=1 -DLOCALE
 -I/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config
-DCONFIG_=\"\"   -c conf.c -o
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/conf.o
/usr/lib/ccache/gcc -I/usr/include/ncursesw   -DCURSES_LOC="<ncurses.h>"
-DNCURSES_WIDECHAR=1 -DLOCALE
 -I/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config
-DCONFIG_=\"\"  -I. -c
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/zconf.tab.c
-o
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/zconf.tab.o
/usr/lib/ccache/gcc -I/usr/include/ncursesw   -DCURSES_LOC="<ncurses.h>"
-DNCURSES_WIDECHAR=1 -DLOCALE
 -I/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config
-DCONFIG_=\"\"
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/conf.o
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/zconf.tab.o
 -o
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/conf
rm
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/zconf.tab.c
  GEN
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/Makefile
BR2_DEFCONFIG=''
KCONFIG_AUTOCONFIG=/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/autoconf.h
KCONFIG_TRISTATE=/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/tristate.config
BR2_CONFIG=/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/.config
HOST_GCC_VERSION="4 8"
BUILD_DIR=/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build
SKIP_LEGACY=
/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/conf
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

make[2]: *** [silentoldconfig] Error 1
make[1]: ***
[/home/kao23/disk_2/99381d37002db28566d1aba257418a38c9edee39/output/build/buildroot-config/auto.conf]
Error 2
make: *** [_all] Error 2


2016-12-26 22:39 GMT+08:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Mon, 26 Dec 2016 22:32:37 +0800, Yu-Ting, Kao wrote:
>
> > I have another problem and it appears many times on many autobuild issue
> > IDs.
>
> Please send the full log, i.e from the point where you start the
> br-reproduce-build command. Also, again, please make sure that the
> 99381d37002db28566d1aba257418a38c9edee39 directory doesn't exist before
> issuing the command.
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161227/1973cbe2/attachment.html>
