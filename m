From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Jun 2013 21:05:15 +0200
Subject: [Buildroot] [git commit] imagemagick: bump to version 6.8.6-2
Message-ID: <20130629190818.A3B929B2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8db50a7ab75ddb9b90195fbfaa3c46bd6673fd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imagemagick/imagemagick.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index e2259e6..12b9f4b 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMAGEMAGICK_MAJOR = 6.7.8
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-8
+IMAGEMAGICK_MAJOR = 6.8.6
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-2
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
