From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:22 +0100
Subject: [Buildroot] [PATCH 09/35] package/x11r7/xapp_iceauth: bump version
	to 1.0.7
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1423339908-2960-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_iceauth/xapp_iceauth.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index 0f6ef3e..d30ff6f 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_ICEAUTH_VERSION = 1.0.6
+XAPP_ICEAUTH_VERSION = 1.0.7
 XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.bz2
 XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICEAUTH_LICENSE = MIT
-- 
1.7.10.4
