From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 28 Jan 2016 21:16:38 +0100
Subject: [Buildroot] [PATCH 2/2] package/imagemagick: bump version to 6.9.3-2
In-Reply-To: <1454012198-25849-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454012198-25849-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454012198-25849-2-git-send-email-bernd.kuhls@t-online.de>
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
index 75ad035..1d5794f 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 da2f6fba43d69f20ddb11783f13f77782b0b57783dde9cda39c9e5e733c2013c ImageMagick-6.9.2-10.tar.xz
+sha256	78a9bfc581c81fb8376c00d06431b49f218d3900690905dc985459cbf5e41c4d	ImageMagick-6.9.3-2.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b3d6a83..76061fa 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.2-10
+IMAGEMAGICK_VERSION = 6.9.3-2
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.7.0.rc3
