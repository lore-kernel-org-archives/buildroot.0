From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Mar 2014 22:43:25 +0100
Subject: [Buildroot] [PATCH 54/91] xapp_xload: Bump version to 1.1.2
In-Reply-To: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396129442-26428-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <berndkuhls@hotmail.com>


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xload/xapp_xload.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index 6b4207a..1db0db5 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLOAD_VERSION = 1.1.1
+XAPP_XLOAD_VERSION = 1.1.2
 XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
 XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOAD_LICENSE = MIT
-- 
1.7.10.4
