From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Apr 2012 11:20:30 +0200
Subject: [Buildroot] [git commit] libusb: bump version
Message-ID: <20120420100656.D102996B30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58e472374f79a240c38077dd2426ecae259013a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libusb/libusb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index fce0c28..9abfcfc 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -3,7 +3,7 @@
 # libusb
 #
 #############################################################
-LIBUSB_VERSION = 1.0.8
+LIBUSB_VERSION = 1.0.9
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
 LIBUSB_DEPENDENCIES = host-pkg-config
