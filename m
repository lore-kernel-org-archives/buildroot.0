From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Dec 2013 10:08:26 +0100
Subject: [Buildroot] [git commit] imagemagick: drop IMAGEMAGICK_MAJOR
	variable
Message-ID: <20131210091112.210E49BF98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd6a8c728e4161d245ba91196123a90de7461342
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is only expanded once just below, so we might as well drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 0af5f0e..4cc0c10 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_MAJOR = 6.8.7
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-9
+IMAGEMAGICK_VERSION = 6.8.7-9
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
