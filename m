From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 10:36:23 +0100
Subject: [Buildroot] [git commit] imagemagick: bump version
Message-ID: <20131111094007.A6F809BBC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c344ec0205178b98c9502f1eb62cf0b151aff3aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -3 version is no longer available at the upstream URL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index a31e799..c8f3a56 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMAGEMAGICK_MAJOR = 6.8.7
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-3
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-5
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
