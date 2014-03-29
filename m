From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Mar 2014 22:43:53 +0100
Subject: [Buildroot] [PATCH 82/91] xapp_xmessage: Bump version to 1.0.4
In-Reply-To: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396129442-26428-34-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <berndkuhls@hotmail.com>


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xmessage/xapp_xmessage.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 61b8a08..9c85563 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMESSAGE_VERSION = 1.0.2
+XAPP_XMESSAGE_VERSION = 1.0.4
 XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.bz2
 XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMESSAGE_LICENSE = MIT
-- 
1.7.10.4
