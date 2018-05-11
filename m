From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 22:29:34 +0200
Subject: [Buildroot] [git commit branch/next] libusb: bump to version 1.0.22
Message-ID: <20180511202943.2DC598C9FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ced4daef825d2c763fab78a4c5bdaa5a2fe12886
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libusb/libusb.hash | 3 ++-
 package/libusb/libusb.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index 0415aab509..7e9d2a2ad2 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 7dce9cce9a81194b7065ee912bcd55eeffebab694ea403ffb91b67db66b1824b  libusb-1.0.21.tar.bz2
+sha256 75aeb9d59a4fdb800d329a545c2e6799f732362193b465ea198f2aa275518157  libusb-1.0.22.tar.bz2
+sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index f0bb9e3335..8d7aed1619 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).21
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).22
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
