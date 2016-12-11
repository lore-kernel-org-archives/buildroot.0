From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Sun, 11 Dec 2016 13:30:29 +0530
Subject: [Buildroot] [PATCH 2/2] jpeg-turbo: fix legal info
In-Reply-To: <1481443229-18342-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1481443229-18342-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1481443229-18342-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update name of license file

Fixes:
  http://autobuild.buildroot.net/results/e97/e97edb7dc573912fd140ac681952634584e9ab32

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
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
 
-- 
2.6.2
