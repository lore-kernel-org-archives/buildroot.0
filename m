From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2013 23:29:41 +0100
Subject: [Buildroot] [git commit] imagemagick: bump to version 6.8.7-8
Message-ID: <20131201225016.B1F699BE95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=971795f55ac4dd1e363762e5b2ef4e1c5f7d4952
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index c8f3a56..0a72fd7 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMAGEMAGICK_MAJOR = 6.8.7
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-5
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-8
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
