From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat,  7 May 2016 09:57:48 +0200
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.3-10
Message-ID: <1462607868-28290-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index ca80848..135989f 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 6731c414b5b939713a73a088840ed68c22c91d1335514d228d6687d07ce2e1c8 ImageMagick-6.9.3-7.tar.xz
+sha256 e33f021c879f31703f9e620f578ccf7d221a34941589da4bbe967b16a814336a ImageMagick-6.9.3-10.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 4d37873..8ecf5d6 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.3-7
+IMAGEMAGICK_VERSION = 6.9.3-10
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
1.9.1
