From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Oct 2017 14:35:33 +0200
Subject: [Buildroot] [git commit branch/2017.02.x]
	package/x11r7/xserver_xorg-server: security bump to version 1.19.4
Message-ID: <20171014150059.CC3577FDF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b5fe1c29e1a4a8697e0b0eeea4fbf66cd089e79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-13721 & CVE-2017-13723:
https://lists.x.org/archives/xorg-announce/2017-October/002809.html

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 436659c55f8d3c6155546cfc666a13c793d992f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/Config.in                | 2 +-
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index b04ccf4..0f1e819 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -99,7 +99,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.19.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
+	default "1.19.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 841be04..d0acc24 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,5 +3,8 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.freedesktop.org/archives/xorg/2017-March/058662.html
-sha256 677a8166e03474719238dfe396ce673c4234735464d6dadf2959b600d20e5a98        xorg-server-1.19.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-October/002808.html
+md5 28cb6d773bfcdfd43500dd64527d2ab0 xorg-server-1.19.4.tar.bz2
+sha1 7a47d5f927ea69681e279c6e5f5e8ff3a21c7152 xorg-server-1.19.4.tar.bz2
+sha256 aa758acea91deaf1f95069ddc5ea3818e13675fb14fef40ad1b3d0b2bf03c9a8 xorg-server-1.19.4.tar.bz2
+sha512 ff80934e42a7dd2d437e947fe02c74c3b25bdbb3002b7005191d52272d5eae8cb3a83377fa32f40000011be88405830e796f6bd3b914bd7fc163ea8ece76226b xorg-server-1.19.4.tar.bz2
