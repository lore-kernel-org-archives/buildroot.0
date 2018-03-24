From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 22:01:20 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdata_xbitmaps: bump version
 to 1.1.2
Message-ID: <20180324210430.383438135E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ce7fdb597ba402d199af280661262ed8d4e4c74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash | 9 +++++++--
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
index 3e5fb32896..05d37288ad 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2010-December/001563.html
-sha1	578afff7e4912192b524c25254cf7f54c16e57d8	xbitmaps-1.1.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002881.html
+md5 cedeef095918aca86da79a2934e03daf  xbitmaps-1.1.2.tar.bz2
+sha1 1cb0e485a66280e9a64b48426140b8a0de9cf169  xbitmaps-1.1.2.tar.bz2
+sha256 b9f0c71563125937776c8f1f25174ae9685314cbd130fb4c2efce811981e07ee  xbitmaps-1.1.2.tar.bz2
+sha512 eed5e2fce9fc6c532984e6ed1262e440591e311ca6c61a7fe7a5c877df84bfc2d7aff388fb9c894fc098785b8e5352f0bd7c918252247a040cf123874847450d  xbitmaps-1.1.2.tar.bz2
+# Locally computed
+sha256 e121ec6605558ee021674d33b1ab9306e16b9ea7d30453df42286556247be17a COPYING
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index 9767f2c143..e9545abaec 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDATA_XBITMAPS_VERSION = 1.1.1
+XDATA_XBITMAPS_VERSION = 1.1.2
 XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
 XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XBITMAPS_LICENSE = MIT
