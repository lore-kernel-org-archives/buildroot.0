From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 19:13:56 +0200
Subject: [Buildroot] [PATCH v2 1/1] xserver_xorg-server: Change default to
	X.org modular server
Message-ID: <1428772436-16962-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Change default for all toolchain configurations (Thomas)

 package/x11r7/xserver_xorg-server/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 1123f3b..54d7c24 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -58,7 +58,7 @@ if BR2_PACKAGE_XSERVER_XORG_SERVER
 
 choice
 	prompt "X Window System server type"
-	default BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+	default BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	help
 	  Select the X Window System server to use
 
-- 
1.7.10.4
