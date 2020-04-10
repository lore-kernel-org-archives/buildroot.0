From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 22:15:25 +0200
Subject: [Buildroot] [git commit] package/libbluray: bump version to 1.2.0
Message-ID: <20200410200128.500768E268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c5fb3f8f409f8c828fa69c6aba5f8ce2dc5c686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://code.videolan.org/videolan/libbluray/-/blob/master/ChangeLog

Updated download URL.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 1757192b00..c92d9f9549 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From http://get.videolan.org/libbluray/1.1.2/libbluray-1.1.2.tar.bz2.sha512
-sha512 5a82af6c1840a1dcb31d06d90203c68e2c4f0bbadc9212eb0bb2776d42b0ab3793a769ebe07b3051be151e8b15876874d5a0658292f72b7126dd915a1ada3fe7  libbluray-1.1.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libbluray/1.2.0/libbluray-1.2.0.tar.bz2.sha512
+sha512 d10413b6b86ff2d2e7c4b0103546f2142727cc5209ddb7b227aa74e27384f2e0b9abee37bf8ccc5b0cdfcaeebfb0669cf20903a247df278a8ad6dbd27469d324  libbluray-1.2.0.tar.bz2
 # Locally computed
 sha256 b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 49ee933d0a..67ea139d58 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.1.2
-LIBBLURAY_SITE = http://get.videolan.org/libbluray/$(LIBBLURAY_VERSION)
+LIBBLURAY_VERSION = 1.2.0
+LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
 LIBBLURAY_LICENSE = LGPL-2.1+
