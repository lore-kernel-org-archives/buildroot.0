From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 12:13:02 +0100
Subject: [Buildroot] [git commit] imagemagick: bump version to 6.9.3-3
Message-ID: <20160208111306.984F57FB0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19d91468239ad12a12a534e6e47ee934c7e06e71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Reviewed-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Tested-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 1d5794f..31ddfd2 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256	78a9bfc581c81fb8376c00d06431b49f218d3900690905dc985459cbf5e41c4d	ImageMagick-6.9.3-2.tar.xz
+sha256	d127f76c674f1454adf0444ecec96f344c3dca522cc3320f0ef88d8060123048	ImageMagick-6.9.3-3.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 76061fa..eee567e 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.3-2
+IMAGEMAGICK_VERSION = 6.9.3-3
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
