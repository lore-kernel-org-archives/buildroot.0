From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:20:41 +0200
Subject: [Buildroot] [git commit] imagemagick: bump to version 6.8.7 0
Message-ID: <20131008203904.24A289B975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=044e39dd3eb7b28947afc43d233014187a78b0e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 2149574..f5aacb6 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMAGEMAGICK_MAJOR = 6.8.6
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-2
+IMAGEMAGICK_MAJOR = 6.8.7
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-0
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
