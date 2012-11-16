From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 18:23:49 +0100
Subject: [Buildroot] [pull request] Pull request for branch xorg-fixes
Message-ID: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of X.org related bumps needed to get rid of the Xmu
related build failures (like
http://autobuild.buildroot.org/results/1a4f84ad76ad8c4e70bff6878fc232edf46ff8f1/build-end.log)
that occur on multiple X.org application packages.

Thanks,

thomas

The following changes since commit 3116742e8f0c45e5ca06b32f91e481763356e03e:

  kexec: disable on unsupported architectures (2012-11-16 17:01:04 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git xorg-fixes

for you to fetch changes up to fb160f69ac3eb6495ffd1b93a14da77606f16b69:

  xapp_xvidtune: bump version to 1.0.2 to fix Xmu related build failure (2012-11-16 18:21:45 +0100)

----------------------------------------------------------------
Thomas Petazzoni (12):
      xlib_libXt: bump version to 1.1.3
      xutil_util-macros: bump to version 1.17
      xapp_editres: bump to 1.0.5 to fix Xmu related build failure
      xapp_twm: bump to 1.0.6 to fix Xmu related build failure
      xapp_viewres: bump to 1.0.3 to fix Xmu related build failure
      xapp_xclipboard: bump to 1.1.2 to fix Xmu related build failure
      xapp_xditview: bump version to 1.0.2 to fix Xmu related build failure
      xapp_xfd: bump version to 1.1.1 to fix Xmu related build failure
      xapp_xload: bump version to 1.1.1 to fix Xmu related build failure
      xapp_xlogo: bump version to 1.0.4 to fix Xmu related build failure
      xapp_xmh: bump version to 1.0.2 to fix Xmu related build failure
      xapp_xvidtune: bump version to 1.0.2 to fix Xmu related build failure

 package/x11r7/xapp_editres/xapp_editres.mk         |    2 +-
 package/x11r7/xapp_twm/xapp_twm.mk                 |    2 +-
 package/x11r7/xapp_viewres/xapp_viewres.mk         |    2 +-
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   |    4 ++--
 package/x11r7/xapp_xditview/xapp_xditview.mk       |    2 +-
 package/x11r7/xapp_xfd/xapp_xfd.mk                 |    2 +-
 package/x11r7/xapp_xload/xapp_xload.mk             |    2 +-
 package/x11r7/xapp_xlogo/xapp_xlogo.mk             |    2 +-
 package/x11r7/xapp_xmh/xapp_xmh.mk                 |    2 +-
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk       |    2 +-
 ...il-don-t-link-makestrs-with-target-cflags.patch |   19 +++++++++----------
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 +-
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 13 files changed, 22 insertions(+), 23 deletions(-)

Thanks,
-- 
Thomas Petazzoni
