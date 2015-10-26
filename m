From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Oct 2015 19:00:55 -0300
Subject: [Buildroot] [PATCH] xorg-server: bump to version 1.17.3
Message-ID: <1445896855-14914-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xserver_xorg-server/Config.in                | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 8b794b3..2e05d5b 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -70,7 +70,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
-	bool "1.17.2"
+	bool "1.17.3"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
@@ -82,7 +82,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.17.2" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
+	default "1.17.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
 choice
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 4f57787..82ae71b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
 # From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
 sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
-# From http://lists.x.org/archives/xorg-announce/2015-June/002614.html
-sha1	56ac29a82b99bcf4c7ba2fca41a44cfa18748262				xorg-server-1.17.2.tar.bz2
-sha256	f61120612728f2c5034671d0ca3e2273438c60aba93b3dda4a8aa40e6a257993	xorg-server-1.17.2.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-October/002647.html
+sha1	78c33555d267fe0feda945d02f627cbc5aacbba5				xorg-server-1.17.3.tar.bz2
+sha256	89b5c6b7e7ec4731645283d2178f607825b75a470e76b3ad3cb1c1dbd2456b73	xorg-server-1.17.3.tar.bz2
-- 
2.4.10
