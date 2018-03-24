From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:55:20 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkill: bump version to
 1.0.5
Message-ID: <20180324210428.2D462834AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a253a49651d114b7372612020db02724e22e94e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xkill/xapp_xkill.hash | 9 +++++++--
 package/x11r7/xapp_xkill/xapp_xkill.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xkill/xapp_xkill.hash b/package/x11r7/xapp_xkill/xapp_xkill.hash
index 22c256d49d..0602971705 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.hash
+++ b/package/x11r7/xapp_xkill/xapp_xkill.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002313.html
-sha256	88ef2a304f32f24b255e879f03c1dcd3a2be3e71d5562205414f267d919f812e	xkill-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002864.html
+md5 938177e4472c346cf031c1aefd8934fc  xkill-1.0.5.tar.bz2
+sha1 c5ee06b33adb252a41e4f737be6bd47651ff582a  xkill-1.0.5.tar.bz2
+sha256 c5f0bb6a95e1ac7c4def8a657496d5d2f21ccd41eb47ef2c9ccb03fb6d6aff6b  xkill-1.0.5.tar.bz2
+sha512 4603a1794f114f5cea2c885020c9d073c8421d1e785c99ff6b936ae97139c8dac8020a187b5bbd0fa6d56ed6fab879441b42ba900cc5f2f5a534dafdc86b9249  xkill-1.0.5.tar.bz2
+# Locally computed
+sha256 13306c3890e4c8710bc468dee0eba7f9677cd94c7a67d2d81fa932d4f635b21f COPYING
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 76af1b95cb..64ddbca694 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKILL_VERSION = 1.0.4
+XAPP_XKILL_VERSION = 1.0.5
 XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
 XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKILL_LICENSE = MIT
