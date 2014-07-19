From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Jul 2014 15:53:18 +0200
Subject: [Buildroot] [PATCH 2/7] xlib_libICE: Bump version to 1.0.9
In-Reply-To: <1405778003-2712-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405778003-2712-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405778003-2712-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libICE/xlib_libICE.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index dd6814e..6f69bfb 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBICE_VERSION = 1.0.8
+XLIB_LIBICE_VERSION = 1.0.9
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
 XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBICE_LICENSE = MIT
-- 
1.7.10.4
