From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon,  1 Jun 2015 21:02:57 +0200
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.1-4
Message-ID: <1433185377-5118-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index b1c9caf..7ac3298 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256 8f6ebeb1a1321fd7b7d3161a66461743ea5bbc352e4339c792b3bab52c379378 ImageMagick-6.9.1-1.tar.xz
+sha256 74973478058069ce44040ff76b61df713d70adcadfd207836cc0622cadf1e4bf ImageMagick-6.9.1-4.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 1594f69..298d0a8 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.1-1
+IMAGEMAGICK_VERSION = 6.9.1-4
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
1.9.1
