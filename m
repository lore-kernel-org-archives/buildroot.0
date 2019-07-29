From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 09:06:17 +0200
Subject: [Buildroot] [git commit] package/pngquant: bump version to 2.12.3
Message-ID: <20190729070358.4248E812E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b954cc0380fb1080d1e2dec8768f8c4b7a9b57eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pngquant/pngquant.hash | 4 ++--
 package/pngquant/pngquant.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
index f27eda60dd..00dd5cd93f 100644
--- a/package/pngquant/pngquant.hash
+++ b/package/pngquant/pngquant.hash
@@ -1,5 +1,5 @@
 # From https://pngquant.org/releases.html
-sha1 24efa42105bf3d8d0f4cf699053d2701ea787bd5  pngquant-2.12.2-src.tar.gz
+sha1 e160eade5897b1c3d991e57b528b4f338674af88  pngquant-2.12.3-src.tar.gz
 # Locally computed
-sha256 bb031c48039ee73ea0e60709bb9ab80c55bfa3a5920b798ea37a03f2757b099c  pngquant-2.12.2-src.tar.gz
+sha256 8bb076832a3f1c826393f4be62df8b637dfd6493b13d5839ad697a8a80ccf95b  pngquant-2.12.3-src.tar.gz
 sha256 e4f467f7abf860b4e620f5f60fdd88bc3a63a0fdb98a481fb002b5e511c9b826  COPYRIGHT
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index 0053b9a46e..801290807b 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PNGQUANT_VERSION = 2.12.2
+PNGQUANT_VERSION = 2.12.3
 PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
