From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 Apr 2010 21:56:20 +0200
Subject: [Buildroot] [pull request] Pull request for branch libusb-conversion
Message-ID: <cover.1270583774.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 6cdcc4d7d8134f4b60f0eb9039090f9ad4c38366:
  Peter Korsgaard (1):
        gcc: hide shared libgcc option if BR2_PREFER_STATIC_LIB is enabled

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot libusb-conversion

Mike Crowe (1):
      libusb: bump version, convert to autotools, add -compat lib

Thomas Petazzoni (1):
      usb_modeswitch: use GENTARGETS instead of AUTOTARGETS

 CHANGES                                            |   12 ++-
 package/Config.in                                  |    1 +
 package/libusb-compat/Config.in                    |    7 ++
 .../libusb-compat-0.1.3-pkgconfig.patch            |   10 +++
 package/libusb-compat/libusb-compat.mk             |   14 +++
 package/libusb/libusb-0.1.12-nocpp.patch           |   20 -----
 package/libusb/libusb.mk                           |   85 ++-----------------
 package/usb_modeswitch/Config.in                   |    2 +-
 .../usb_modeswitch-1.0.7-build-system-fix.patch    |   29 +++++++
 .../usb_modeswitch/usb_modeswitch-nostrip.patch    |   11 ---
 package/usb_modeswitch/usb_modeswitch.mk           |   28 +++----
 11 files changed, 92 insertions(+), 127 deletions(-)
 create mode 100644 package/libusb-compat/Config.in
 create mode 100644 package/libusb-compat/libusb-compat-0.1.3-pkgconfig.patch
 create mode 100644 package/libusb-compat/libusb-compat.mk
 delete mode 100644 package/libusb/libusb-0.1.12-nocpp.patch
 create mode 100644 package/usb_modeswitch/usb_modeswitch-1.0.7-build-system-fix.patch
 delete mode 100644 package/usb_modeswitch/usb_modeswitch-nostrip.patch

Thanks,
-- 
Thomas Petazzoni
