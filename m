From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:04:22 +0200
Subject: [Buildroot] [git commit] imagemagick: security bump to version
	6.7.8-8
Message-ID: <20120815100429.4FFF5971A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e21517689de5e1f56dc2aa788a4aa84f89c54c8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2012-3437, CVE-2012-3437 and CVE-2012-3438.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index ede129a..6d34ad3 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-IMAGEMAGICK_MAJOR = 6.7.6
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-9
+IMAGEMAGICK_MAJOR = 6.7.8
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-8
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
