From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Apr 2016 21:32:39 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: bump
	version to 1.18.3
Message-ID: <20160405194001.CB73E8024D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42b845aac5fe7d7cbd76efd13e7c82dd4a906aa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/Config.in                | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index d723102..26b9c8e 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -70,7 +70,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
-	bool "1.18.2"
+	bool "1.18.3"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
@@ -82,7 +82,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.18.2" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
+	default "1.18.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
 choice
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 7e838d7..2172c89 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
 # From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
 sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
-# From https://lists.freedesktop.org/archives/xorg-announce/2016-March/002681.html
-sha256	022142b07f6477d140dcc915902df326408a53ca3a352426a499f142b25d632d	xorg-server-1.18.2.tar.bz2
+# From https://lists.freedesktop.org/archives/xorg-announce/2016-April/002683.html
+sha256	ea739c22517cdbe2b5f7c0a5fd05fe8a10ac0629003e71c0c7862f4bb60142cd	xorg-server-1.18.3.tar.bz2
