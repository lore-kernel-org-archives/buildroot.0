From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 09:10:14 +0200
Subject: [Buildroot] [git commit] package/mjpegtools: install to staging
Message-ID: <20190501071329.6542681585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7002f1ac63302b55165ee8c0465cfb6f3fc80c5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mpeg2enc plugin in gst1-plugins-bad now depends on mjpegtools.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
 
