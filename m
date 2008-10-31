From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2008 10:25:59 +0100
Subject: [Buildroot] [PATCH] Bump lite version
Message-ID: <20081031102559.70648045@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump Lite version

Bump Lite version to 0.8.10.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lite/lite.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: buildroot2/package/lite/lite.mk
===================================================================
--- buildroot2.orig/package/lite/lite.mk
+++ buildroot2/package/lite/lite.mk
@@ -3,7 +3,7 @@
 # LiTE
 #
 #############################################################
-LITE_VERSION:=0.8.9
+LITE_VERSION:=0.8.10
 LITE_SOURCE:=LiTE-$(LITE_VERSION).tar.gz
 LITE_SITE:=http://www.directfb.org/downloads/Libs
 LITE_AUTORECONF = NO


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
