From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 28 Aug 2019 18:38:09 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/pngquant: bump version to
 2.12.5
Message-ID: <20190828163809.5805-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream now provides a sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pngquant/pngquant.hash | 3 +--
 package/pngquant/pngquant.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
index 00dd5cd93f..f67807cb8f 100644
--- a/package/pngquant/pngquant.hash
+++ b/package/pngquant/pngquant.hash
@@ -1,5 +1,4 @@
 # From https://pngquant.org/releases.html
-sha1 e160eade5897b1c3d991e57b528b4f338674af88  pngquant-2.12.3-src.tar.gz
+sha256 3638936cf6270eeeaabcee42e10768d78e4dc07cac9310307835c1f58b140808  pngquant-2.12.5-src.tar.gz
 # Locally computed
-sha256 8bb076832a3f1c826393f4be62df8b637dfd6493b13d5839ad697a8a80ccf95b  pngquant-2.12.3-src.tar.gz
 sha256 e4f467f7abf860b4e620f5f60fdd88bc3a63a0fdb98a481fb002b5e511c9b826  COPYRIGHT
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index 801290807b..a8845c7972 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PNGQUANT_VERSION = 2.12.3
+PNGQUANT_VERSION = 2.12.5
 PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
-- 
2.20.1
