From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Mar 2014 22:43:38 +0100
Subject: [Buildroot] [PATCH 67/91] xapp_twm: Bump version to 1.0.8
In-Reply-To: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396129442-26428-19-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <berndkuhls@hotmail.com>


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_twm/xapp_twm.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index f566e10..e004b8d 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_TWM_VERSION = 1.0.6
+XAPP_TWM_VERSION = 1.0.8
 XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_LICENSE = MIT
-- 
1.7.10.4
