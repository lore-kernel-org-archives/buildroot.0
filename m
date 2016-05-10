From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 May 2016 17:16:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: bump version to 6.9.4-1
Message-ID: <1462893393-18580-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 135989f..0f8ab18 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 e33f021c879f31703f9e620f578ccf7d221a34941589da4bbe967b16a814336a ImageMagick-6.9.3-10.tar.xz
+sha256	2ea0fef839cd5d6f134502b7cf7ee0e57a3f230b19771515d4aa44354f4c6b3b	ImageMagick-6.9.4-1.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 8ecf5d6..c952c2a 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.3-10
+IMAGEMAGICK_VERSION = 6.9.4-1
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.8.1
