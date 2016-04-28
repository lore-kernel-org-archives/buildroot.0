From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 20:15:08 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.68
Message-ID: <20160428193041.BC1E07FE24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f8851d49cb1a28fb2110a788da8d856e9a8d7b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 4 ++--
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 8e3104c..8bd3d95 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2016-February/100859.html
-sha256	ee5b71e1113be37544d0752681c12f040c01f782e2933df7d7bc21fd0d10cebe	libdrm-2.4.67.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2016-April/106211.html
+sha256	5b4bd9a5922929bc716411cb74061fbf31b06ba36feb89bc1358a91a8d0ca9df	libdrm-2.4.68.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 4082a19..1d41f05 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.67
+LIBDRM_VERSION = 2.4.68
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
