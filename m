From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Aug 2016 23:28:12 +0200
Subject: [Buildroot] [git commit] package/imagemagick: bump to version
	7.0.2-6
Message-ID: <20160803212921.EE6B38211F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba865a4c92454e75340908e2e0dec38180fba130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 1665112..71cfeda 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 44b5c7cb930c85c0dc0da258fb2721b0c34bf9005a0778253fc4cd9e0deca508  ImageMagick-7.0.2-5.tar.xz
+sha256 1e173314ddcf1508f9f4c20ddd650883e089dea6acbedd8f2c54d02109104cf9 ImageMagick-7.0.2-6.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index ece3e36..2d2fe76 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.2-5
+IMAGEMAGICK_VERSION = 7.0.2-6
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
