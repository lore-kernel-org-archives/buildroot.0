From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:59:39 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xlsfonts: bump version
 to 1.0.6
Message-ID: <20180324210428.8298C806A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=095036df4ca23adbab3416fdf893a8e92dfb0774
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash | 9 +++++++--
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
index f3a2603171..f76369f97e 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002580.html
-sha256	40295bec35077cee93be2e4c26cc00268ed6ace779ae6e97766a866c1e3927fa	xlsfonts-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002867.html
+md5 5774fd4f518b3f338f2b28f270e04bfc  xlsfonts-1.0.6.tar.bz2
+sha1 bf95e46e0897dcb9d197ce20d4fa024b8ace5148  xlsfonts-1.0.6.tar.bz2
+sha256 89b80b3a030006ab6cef717be286c12f2477894b227158b1e6133274f6ebd368  xlsfonts-1.0.6.tar.bz2
+sha512 052a3b1dec23cb20fdfacd4500cb836feb3b888bf568a548ea71deb58a4ba10a1ad5392d658e95272c6d4a1832edf1f19c3de2498b78dca82c43ee52800a30c0  xlsfonts-1.0.6.tar.bz2
+# Locally computed
+sha256 dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5 COPYING
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index 1c42a61a97..0ccd4ea6b0 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSFONTS_VERSION = 1.0.5
+XAPP_XLSFONTS_VERSION = 1.0.6
 XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSFONTS_LICENSE = MIT
