From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 10:22:09 +0100
Subject: [Buildroot] [git commit] xorg-server: bump to version 1.17.4
Message-ID: <20151029092252.0BAF981F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d924d8701210116ed71b4ffd83c4f041561ef55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |    4 ++--
 .../xserver_xorg-server/xserver_xorg-server.hash   |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 2e05d5b..84f0298 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -70,7 +70,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
-	bool "1.17.3"
+	bool "1.17.4"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
@@ -82,7 +82,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.17.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
+	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
 choice
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 82ae71b..0119e37 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
 # From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
 sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
-# From http://lists.x.org/archives/xorg-announce/2015-October/002647.html
-sha1	78c33555d267fe0feda945d02f627cbc5aacbba5				xorg-server-1.17.3.tar.bz2
-sha256	89b5c6b7e7ec4731645283d2178f607825b75a470e76b3ad3cb1c1dbd2456b73	xorg-server-1.17.3.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-October/002650.html
+sha1	139c4d6795eb4c3848616cc514d134532975e49e				xorg-server-1.17.4.tar.bz2
+sha256	0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457	xorg-server-1.17.4.tar.bz2
