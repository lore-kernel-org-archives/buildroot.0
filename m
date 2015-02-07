From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:18 +0100
Subject: [Buildroot] [PATCH 05/35] package/x11r7/xapp_bdftopcf: bump version
	to 1.0.5
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1423339908-2960-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 64c2103..ebdcda5 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_BDFTOPCF_VERSION = 1.0.4
+XAPP_BDFTOPCF_VERSION = 1.0.5
 XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
 XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BDFTOPCF_LICENSE = MIT
-- 
1.7.10.4
