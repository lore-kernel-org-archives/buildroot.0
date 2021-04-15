From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Apr 2021 08:22:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: security
 bump version to 1.20.11
Message-ID: <20210415062258.10838-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2021-3472:
https://lists.x.org/archives/xorg-announce/2021-April/003080.html

Release notes:
https://lists.x.org/archives/xorg-announce/2021-April/003081.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index d6b3c92e08..9876255c8e 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-December/003067.html
-sha256  977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99  xorg-server-1.20.10.tar.bz2
-sha512  a07bee380bb72f2117fe6f831a6e4aded19bea1f2b36e42a019a30348e98d6fe65c0617cf819be9c6b405502f88cafb829df30aab32393774b71f1418a4cefae  xorg-server-1.20.10.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-April/003081.html
+sha256  914c796e3ffabe1af48071d40ccc85e92117c97a9082ed1df29e4d64e3c34c49  xorg-server-1.20.11.tar.bz2
+sha512  1017015b9fd5d53788abe3641d877e6df8609841fa5c1847c0a5e133ddcc1b758a5d695304ebd36828099ec201a85b6b70b46f5ea4f81c5bd3a16fa6e175e3c2  xorg-server-1.20.11.tar.bz2
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index fa8ae13b8c..3fa77cd4f0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.20.10
+XSERVER_XORG_SERVER_VERSION = 1.20.11
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.29.2
