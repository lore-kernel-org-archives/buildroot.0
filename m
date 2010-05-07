From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 May 2010 21:30:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes
Message-ID: <cover.1273260574.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a resend of this patch set, with an additional check that
Python is actually installed on the host.

Thomas

The following changes since commit ea0695ff5edff392603a77b9299833fbb399e429:
  Luca Ceresoli (1):
        customize: fix copy paths

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot misc-fixes

Thomas Petazzoni (3):
      busybox: disable MTD utils in default configuration
      libxcb: fix path to Python modules
      xlib_libX11: re-add a patch to fix the keysymdef issue

 package/busybox/busybox-1.16.x.config              |    8 ++--
 package/x11r7/libxcb/libxcb.mk                     |    3 +-
 .../xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch  |   35 ++++++++++++++++++++
 toolchain/dependencies/dependencies.sh             |    2 +-
 4 files changed, 42 insertions(+), 6 deletions(-)
 create mode 100644 package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch

Thanks,
-- 
Thomas Petazzoni
