From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Mar 2014 20:36:43 +0200
Subject: [Buildroot] [PATCH 2/8] xlib_xtrans: Version bump 1.3.3
In-Reply-To: <1396204609-5042-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396204609-5042-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396204609-5042-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_xtrans/xlib_xtrans.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 8c5fd42..ecfdc7e 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_XTRANS_VERSION = 1.3.2
+XLIB_XTRANS_VERSION = 1.3.3
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_LICENSE = MIT
-- 
1.7.10.4
