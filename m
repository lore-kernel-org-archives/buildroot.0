From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 22:00:38 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xrefresh: bump version
 to 1.0.6
Message-ID: <20180324210429.561118379F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b96225bd44dc74d426e6033cf01f6f815a30d9b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xrefresh/xapp_xrefresh.hash | 9 +++++++--
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
index 6d5a53b009..8eae8ed1bb 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002214.html
-sha256	3213671b0a8a9d1e8d1d5d9e3fd86842c894dd9acc1be2560eda50bc1fb791d6	xrefresh-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002872.html
+md5 c56fa4adbeed1ee5173f464a4c4a61a6  xrefresh-1.0.6.tar.bz2
+sha1 11eb5b3f905631281d2cedd86a0b666bab0d9bdc  xrefresh-1.0.6.tar.bz2
+sha256 287dfb9bb7e8d780d07e672e3252150850869cb550958ed5f8401f0835cd6353  xrefresh-1.0.6.tar.bz2
+sha512 361e97fecfc2706d5eeab69df0d4dd4baa55b6783cfddabf51d8561b7c930d71ce6c217e0512c6564208d69b04f89c69ea8c0bfb2e4f6cc25b062b55e4db3674  xrefresh-1.0.6.tar.bz2
+# Locally computed
+sha256 4f51c9a91cd277697cbea6604bf4cb240c1ed14cdba82550cb9cac8f1286f663 COPYING
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 8403762c8e..36a4feaad1 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XREFRESH_VERSION = 1.0.5
+XAPP_XREFRESH_VERSION = 1.0.6
 XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
 XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XREFRESH_LICENSE = MIT
