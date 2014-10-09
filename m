From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Oct 2014 18:10:44 +0200
Subject: [Buildroot] [PATCH 1/5] libgeotiff: bump to version 1.4.0
Message-ID: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgeotiff/libgeotiff.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 5cfcbea..f6568c1 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.3.0
+LIBGEOTIFF_VERSION = 1.4.0
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_DEPENDENCIES = tiff
 LIBGEOTIFF_INSTALL_STAGING = YES
-- 
2.0.0
