From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  9 Feb 2016 19:53:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: bump
	version to 1.18.1
Message-ID: <1455044006-25742-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in                | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index ac1369e..007843d 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -70,7 +70,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
-	bool "1.18.0"
+	bool "1.18.1"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
@@ -82,7 +82,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.18.0" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
+	default "1.18.1" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
 choice
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 72c00c4..6024395 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
 # From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
 sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
-# From http://lists.x.org/archives/xorg-announce/2015-November/002655.html
-sha1	f37f9ca17d211552c775c3ce78ff03385026bf3a				xorg-server-1.18.0.tar.bz2
-sha256	195670819695d9cedd8dde95fbe069be0d0f488a77797a2d409f9f702daf312e	xorg-server-1.18.0.tar.bz2
+# From https://lists.freedesktop.org/archives/xorg-announce/2016-February/002674.html
+sha1	968fe85773a41296199f8733c7235c8623d7c460				xorg-server-1.18.1.tar.bz2
+sha256	85ec56dbeb89a951295cdf4f39bf38e515f900d35e06d4a8081b114d1520789d	xorg-server-1.18.1.tar.bz2
-- 
2.7.0
