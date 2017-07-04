From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 15:45:31 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/imagemagick: bump
	version to 7.0.5-9
Message-ID: <20170704134556.41AE180106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f33fa2f124b9c76913e720952bcce59957828c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes
http://autobuild.buildroot.net/results/8d9/8d94627ccce15ae1f348a7a9f54621b2b5a74321/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ff26b550dec17ec84f0c4db03c70bd56c157d848)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index ce7e6b8..c6f427e 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 007648793640b1d33f1285426df7c43fcf412eaef27b0b68fa7977bf29c4d30e  ImageMagick-7.0.5-8.tar.xz
+sha256 b774c3a69fea4432a120a8c0c231bd011710166c71a7b7e0fbb89b108d29ac6c  ImageMagick-7.0.5-9.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index ae6122c..37faf54 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-8
+IMAGEMAGICK_VERSION = 7.0.5-9
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
