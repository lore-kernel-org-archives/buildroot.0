From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Dec 2016 09:29:45 +0100
Subject: [Buildroot] [git commit] jpeg-turbo: fix legal info
Message-ID: <20161211083337.2F1F07FC1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2063014ff2ee845e00d600fbd699df05c2efa72f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update name of license file

Fixes:
  http://autobuild.buildroot.net/results/e97/e97edb7dc573912fd140ac681952634584e9ab32

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index c0a430c..91d6b4e 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -8,7 +8,7 @@ JPEG_TURBO_VERSION = 1.5.1
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
-JPEG_TURBO_LICENSE_FILES = README README-turbo.txt
+JPEG_TURBO_LICENSE_FILES = LICENSE.md
 JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
 
