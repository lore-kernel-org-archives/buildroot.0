From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 09:43:28 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xdriinfo: bump version
 to 1.0.6
Message-ID: <20180311084456.762E68007A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33b9dcd5e10f1eeb43d1d4565b1e673127d464c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash | 9 +++++++--
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
index 264ec9a016..80a4ac48f4 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002570.html
-sha256	4cba3766ef89557422062287248adeb933999071bad6f3ef9c0a478a3c680119	xdriinfo-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002858.html
+md5 480e63cd365f03eb2515a6527d5f4ca6  xdriinfo-1.0.6.tar.bz2
+sha1 11682ae1f04a311b832651d78bbf4c6ac77f0ed9  xdriinfo-1.0.6.tar.bz2
+sha256 d9ccd2c3e87899417acc9ea1f3e319a4198112babe1dc711273584f607449d51  xdriinfo-1.0.6.tar.bz2
+sha512 7ddd9e19abaef93e4d85004293528ec3814ef84c470d496dbb8dc8313d804bb7520406de8d33d2bc2b3af942bd0a5d5032a109b2726438a966af63ea680a102f  xdriinfo-1.0.6.tar.bz2
+# Locally computed
+sha256 de2fbb160bbb64c48975d7a3ebe3636a312b73227df1efe37488a8cecb9c1932  COPYING
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index ffab5170dc..00dea8c7ad 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDRIINFO_VERSION = 1.0.5
+XAPP_XDRIINFO_VERSION = 1.0.6
 XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
 XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDRIINFO_LICENSE = MIT
