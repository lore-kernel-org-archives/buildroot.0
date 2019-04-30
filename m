From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 30 Apr 2019 10:27:07 -0400
Subject: [Buildroot] [PATCH v4 02/10] package/mjpegtools: install to staging
In-Reply-To: <20190430142715.66338-1-aduskett@gmail.com>
References: <20190430142715.66338-1-aduskett@gmail.com>
Message-ID: <20190430142715.66338-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The mpeg2enc plugin in gst1-plugins-bad now depends on mjpegtools.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Added this patch to the series.

Changes v2 -> v3:
  - None

Changes v3 -> v4:
  - Moved this patch to the second of the series.

 package/mjpegtools/mjpegtools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
index 14713c868e..8cb383dd16 100644
--- a/package/mjpegtools/mjpegtools.mk
+++ b/package/mjpegtools/mjpegtools.mk
@@ -7,6 +7,7 @@
 MJPEGTOOLS_VERSION = 2.1.0
 MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEGTOOLS_VERSION)
 MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
+MJPEGTOOLS_INSTALL_STAGING = YES
 MJPEGTOOLS_LICENSE = GPL-2.0+
 MJPEGTOOLS_LICENSE_FILES = COPYING
 
-- 
2.20.1
