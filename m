From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  9 Mar 2012 15:39:46 +0100
Subject: [Buildroot] [PATCH 1/5] tiff: bump to 4.0.1
Message-ID: <1331303990-13548-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/tiff/tiff.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index ed05bf1..3ab0d4f 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -3,11 +3,10 @@
 # tiff
 #
 #############################################################
-TIFF_VERSION:=3.9.4
-TIFF_SITE:=ftp://ftp.remotesensing.org/pub/libtiff
-TIFF_SOURCE:=tiff-$(TIFF_VERSION).tar.gz
+TIFF_VERSION = 4.0.1
+TIFF_SITE = ftp://ftp.remotesensing.org/pub/libtiff
+TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.gz
 TIFF_INSTALL_STAGING = YES
-TIFF_INSTALL_TARGET = YES
 TIFF_CONF_OPT = \
 	--disable-cxx \
 	--without-x \
-- 
1.7.7
