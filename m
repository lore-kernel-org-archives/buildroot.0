From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:47 +0100
Subject: [Buildroot] [PATCH 34/35] package/x11r7/xdriver_xf86-video-geode:
	mark as broken
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1423339908-2960-34-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-geode/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index 0b45fb1..b70e344 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -6,5 +6,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	depends on BR2_i386
+	depends on BROKEN # Fails to build with xorg xserver >= 1.17
 	help
 	  video driver for geode device
-- 
1.7.10.4
