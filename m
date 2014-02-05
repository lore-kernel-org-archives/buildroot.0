From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 14:50:52 +0100
Subject: [Buildroot] [PATCH 0 of 8 v2] Remove remaining deprecated packages
	for 2014.02
Message-ID: <patchbomb.1391608252@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patch series removes all deprecated packages/features that we are
allowed to remove for 2014.02 (deprecated since 2013.02 or earlier).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2:
- update BR2_HAVE_DOCUMENTATION patch with comments from ThomasP.
- new tentative patch removing DISABLE_DOCUMENTATION

 Config.in                                              |  18 --
 Config.in.legacy                                       |  86 ++++++++++++++
 Makefile                                               |   2 -
 package/Config.in                                      |   4 -
 package/Makefile.in                                    |  12 -
 package/autoconf/Config.in                             |  10 -
 package/autoconf/autoconf.mk                           |   6 -
 package/automake/Config.in                             |  11 -
 package/automake/automake.mk                           |   3 -
 package/avahi/avahi.mk                                 |   2 +-
 package/berkeleydb/berkeleydb.mk                       |   4 -
 package/ccache/Config.in                               |  12 -
 package/ccache/ccache.mk                               |   1 -
 package/enlightenment/enlightenment.mk                 |   2 -
 package/ffmpeg/ffmpeg.mk                               |   2 +-
 package/gdb/Config.in.host                             |  12 -
 package/hdparm/hdparm.mk                               |   7 -
 package/kmod/kmod.mk                                   |  10 +-
 package/libbsd/libbsd.mk                               |   6 -
 package/linux-headers/Config.in.host                   |  15 --
 package/logsurfer/logsurfer.mk                         |  13 --
 package/ncurses/ncurses.mk                             |   2 +-
 package/netsnmp/netsnmp.mk                             |   7 +-
 package/opencv/opencv.mk                               |   4 +-
 package/perl/perl.mk                                   |   4 -
 package/pkg-autotools.mk                               |   7 +-
 package/pppd/pppd.mk                                   |  10 -
 package/pulseaudio/pulseaudio.mk                       |   2 +-
 package/python-pygame/python-pygame.mk                 |   2 -
 package/samba/samba.mk                                 |   2 -
 package/udisks/udisks.mk                               |   3 +-
 package/vala/vala.mk                                   |  10 +-
 package/vim/vim.mk                                     |   2 -
 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |   2 +-
 package/x11r7/xproto_xextproto/xproto_xextproto.mk     |   2 +-
 package/xstroke/Config.in                              |  14 --
 package/xstroke/xstroke-fix-link-issues.patch          |  35 -----
 package/xstroke/xstroke.mk                             |  13 --
 38 files changed, 108 insertions(+), 251 deletions(-)
