From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon,  2 Mar 2015 10:23:50 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.0-9
Message-ID: <1425288230-8290-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index f425c3d..d4a65b6 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256 90c90397ccf74200cd0e3931d3b26e6722665db235a66a5af392ac25d133d8c2 ImageMagick-6.9.0-7.tar.xz
+sha256 4f680e1ccfa31e18a8ca829e7749ebd62f2f81dfdba943f9504a824176f51c76 ImageMagick-6.9.0-9.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index ab2b792..9a10e93 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-7
+IMAGEMAGICK_VERSION = 6.9.0-9
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
1.9.1
