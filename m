From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Mar 2016 19:16:16 +0100
Subject: [Buildroot] [PATCH 1/3] package/x11r7/xserver_xorg-server: bump
	version to 1.18.2
Message-ID: <1457892978-10165-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in                | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 007843d..d723102 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -70,7 +70,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
-	bool "1.18.1"
+	bool "1.18.2"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
@@ -82,7 +82,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.18.1" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
+	default "1.18.2" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
 choice
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 6024395..7e838d7 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,5 @@
 # From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
 sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
-# From https://lists.freedesktop.org/archives/xorg-announce/2016-February/002674.html
-sha1	968fe85773a41296199f8733c7235c8623d7c460				xorg-server-1.18.1.tar.bz2
-sha256	85ec56dbeb89a951295cdf4f39bf38e515f900d35e06d4a8081b114d1520789d	xorg-server-1.18.1.tar.bz2
+# From https://lists.freedesktop.org/archives/xorg-announce/2016-March/002681.html
+sha256	022142b07f6477d140dcc915902df326408a53ca3a352426a499f142b25d632d	xorg-server-1.18.2.tar.bz2
-- 
2.7.0
