From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Apr 2012 21:50:25 +0200
Subject: [Buildroot] [git commit] libusb-compat: bump to 0.1.4
Message-ID: <20120424200000.2EF6E96BB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da5948fe720d5a074186f973a9effc53cae00de0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libusb-compat/libusb-compat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 42a9aae..d44eb27 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -3,7 +3,7 @@
 # libusb-compat
 #
 #############################################################
-LIBUSB_COMPAT_VERSION = 0.1.3
+LIBUSB_COMPAT_VERSION = 0.1.4
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config libusb
