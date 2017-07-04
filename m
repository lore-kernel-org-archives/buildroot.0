From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 15:45:40 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/imagemagick: bump
	version to 7.0.5-10
Message-ID: <20170704134556.5204180106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0981a58ca57db3a4f2cec027be727ca3b333ed9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 44650969234a8f58552e36b3ee248c99661c8bf4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index c6f427e..173dd41 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 b774c3a69fea4432a120a8c0c231bd011710166c71a7b7e0fbb89b108d29ac6c  ImageMagick-7.0.5-9.tar.xz
+sha256 0058fcde533986334458a5c99600b1b9633182dd9562cbad4ba618c5ccf2a28f  ImageMagick-7.0.5-10.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 37faf54..7aade62 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-9
+IMAGEMAGICK_VERSION = 7.0.5-10
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
