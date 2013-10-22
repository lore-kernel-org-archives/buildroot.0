From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 23:16:11 +0200
Subject: [Buildroot] [git commit] imagemagick: bump to version 6.8.7-1
Message-ID: <20131022220914.2CEBE9B6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40316ab81f2df42737eb9f7369445ffa68a6e404
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f5aacb6..4b58148 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 IMAGEMAGICK_MAJOR = 6.8.7
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-0
-IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-1
+IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
 # older versions.
