From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Sep 2012 09:49:02 -0300
Subject: [Buildroot] [PATCH] tiff: security bump to version 4.0.3
Message-ID: <1348577342-8759-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2012-3401 and CVE-2012-3386.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tiff/tiff.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 227047b..145d929 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -3,9 +3,9 @@
 # tiff
 #
 #############################################################
-TIFF_VERSION = 4.0.1
-TIFF_SITE = ftp://ftp.remotesensing.org/pub/libtiff
-TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.gz
+
+TIFF_VERSION = 4.0.3
+TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPT = \
 	--disable-cxx \
-- 
1.7.8.6
