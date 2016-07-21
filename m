From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 Jul 2016 21:07:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xserver_xorg-server: bump
	version to 1.18.4
In-Reply-To: <1469128040-4558-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469128040-4558-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1469128040-4558-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in                | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index af1bac9..df3801c 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -74,7 +74,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
-	bool "1.18.3"
+	bool "1.18.4"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
@@ -91,7 +91,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.18.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
+	default "1.18.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index abd1589..ab7ba7e 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,5 +3,5 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.freedesktop.org/archives/xorg-announce/2016-April/002683.html
-sha256	ea739c22517cdbe2b5f7c0a5fd05fe8a10ac0629003e71c0c7862f4bb60142cd	xorg-server-1.18.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-July/002699.html
+sha256 278459b2c31d61a15655d95a72fb79930c480a6bb8cf9226e48a07df8b1d31c8        xorg-server-1.18.4.tar.bz2
-- 
2.8.1
