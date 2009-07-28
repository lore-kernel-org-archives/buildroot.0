From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2009 11:55:11 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	xorg-bump-versions
Message-ID: <cover.1248774911.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit e63fd15e202a3e5e6ee8d5ecb181610fc2d07f45:
  Peter Korsgaard (1):
        Merge branch 'xconfig-documentation' of git://git.busybox.net/~tpetazzoni/git/buildroot

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot xorg-bump-versions

Thomas Petazzoni (4):
      xorg: bump libXt to 1.0.6
      xorg: bump X.org server version to 1.5.3
      xorg: bump version of xutil/macros to 1.2.2
      xorg: add a new cross-compile fix for libXt 1.0.6

 .../xlib_libXt-1.0.5-makestrs-nocc.patch           |   52 --------------------
 .../xlib_libXt-1.0.6-cross-compile-fix.patch       |   28 +++++++++++
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    5 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 .../xutil_util-macros-1.1.6-linuxdoc.patch         |   15 ------
 .../xutil_util-macros-1.1.6.patch                  |    8 ---
 .../xutil_util-macros-1.2.2.patch                  |   16 ++++++
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 8 files changed, 49 insertions(+), 79 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXt/xlib_libXt-1.0.5-makestrs-nocc.patch
 create mode 100644 package/x11r7/xlib_libXt/xlib_libXt-1.0.6-cross-compile-fix.patch
 delete mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6-linuxdoc.patch
 delete mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6.patch
 create mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.2.2.patch

Thanks,
-- 
Thomas Petazzoni
