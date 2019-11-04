From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:45:13 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkbprint: bump version
 to 1.0.5
Message-ID: <20191104203814.E62708E619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f755900984df4f29e2957ffdcc3d505588f8031a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xkbprint/xapp_xkbprint.hash | 9 +++++++--
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
index 9ec83b6592..c7e0747f06 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002578.html
-sha256	0b3faab8fefad03dfb7e866f634cf859822801de6b5fc6cf5e0a62857ed93e12	xkbprint-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-November/003030.html
+md5 9c34da77363dc3d0f616980da87244bf  xkbprint-1.0.5.tar.bz2
+sha1 e707caffb3c680b3a869a776aa3f80caeac9e9c3  xkbprint-1.0.5.tar.bz2
+sha256 5b58fe834f0822f06d63d283fac404098c6d3f6acce61888b81016f1c41023fa  xkbprint-1.0.5.tar.bz2
+sha512 ac3870352f3a595b5b8a8cb64f39e9bea81b17572c73cfbf72482477a2f576d0ffcdcf735cb3c66b8a88a7fe0f7aece6738cbac87df5641e44fae1ab9b97111f  xkbprint-1.0.5.tar.bz2
+# Locally computed
+sha256 79b32f28f7f5063054a564e1fdeee56f82a525b6516303704a1f70e55fe7197e  COPYING
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index 5f2300f8be..8643cb4276 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBPRINT_VERSION = 1.0.4
+XAPP_XKBPRINT_VERSION = 1.0.5
 XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.bz2
 XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBPRINT_LICENSE = MIT
