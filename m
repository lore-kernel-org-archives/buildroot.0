From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 15:45:26 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/imagemagick: bump
	version to 7.0.5-8
Message-ID: <20170704134556.28FA880106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdb12a8118757a31d4b456dfceec667fc203adb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 04588a378d2eb0c10aed3cadbd2fc29c87055f98)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 8f74618..ce7e6b8 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 f72d089074d6c968bab38d1c18b22bd92c876e7ae23f7261db0b7c3552186586  ImageMagick-7.0.5-7.tar.xz
+sha256 007648793640b1d33f1285426df7c43fcf412eaef27b0b68fa7977bf29c4d30e  ImageMagick-7.0.5-8.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 46ee404..ae6122c 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-7
+IMAGEMAGICK_VERSION = 7.0.5-8
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
