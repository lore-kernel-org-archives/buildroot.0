From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Mar 2014 22:43:43 +0100
Subject: [Buildroot] [PATCH 72/91] xapp_xkbutils: Bump version to 1.0.4
In-Reply-To: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396129442-26428-24-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <berndkuhls@hotmail.com>


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index eaabea5..96ca8a4 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBUTILS_VERSION = 1.0.3
+XAPP_XKBUTILS_VERSION = 1.0.4
 XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
 XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBUTILS_LICENSE = MIT
-- 
1.7.10.4
