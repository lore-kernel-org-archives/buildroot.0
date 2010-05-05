From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 May 2010 23:55:14 +0200
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes
Message-ID: <cover.1273096504.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit d701a82321ad2f3e5bfa16639e93532294cad4ce:
  Paulius Zaleckas (1):
        Remove gtk-doc documentations from target

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot misc-fixes

Thomas Petazzoni (3):
      busybox: disable MTD utils in default configuration
      libxcb: fix path to Python modules
      xlib_libX11: re-add a patch to fix the keysymdef issue

 package/busybox/busybox-1.16.x.config              |    8 ++--
 package/x11r7/libxcb/libxcb.mk                     |    3 +-
 .../xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch  |   35 ++++++++++++++++++++
 3 files changed, 41 insertions(+), 5 deletions(-)
 create mode 100644 package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch

Thanks,
-- 
Thomas Petazzoni
