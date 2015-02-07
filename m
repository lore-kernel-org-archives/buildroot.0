From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:21 +0100
Subject: [Buildroot] [PATCH 08/35] package/x11r7/xapp_fstobdf: bump version
	to 1.0.6
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1423339908-2960-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index b57220f..e897514 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FSTOBDF_VERSION = 1.0.5
+XAPP_FSTOBDF_VERSION = 1.0.6
 XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.bz2
 XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FSTOBDF_LICENSE = MIT
-- 
1.7.10.4
