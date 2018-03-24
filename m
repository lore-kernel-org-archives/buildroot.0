From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 22:00:46 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xset: bump version to
 1.2.4
Message-ID: <20180324210429.83DC88135E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d6c7bbbe1e6404658675aef503bc02899d3ef90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xset/xapp_xset.hash | 9 +++++++--
 package/x11r7/xapp_xset/xapp_xset.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xset/xapp_xset.hash b/package/x11r7/xapp_xset/xapp_xset.hash
index f9ff3920c6..62f951ba70 100644
--- a/package/x11r7/xapp_xset/xapp_xset.hash
+++ b/package/x11r7/xapp_xset/xapp_xset.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-August/002291.html
-sha256	4382f4fb29b88647e13f3b4bc29263134270747fc159cfc5f7e3af23588c8063	xset-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002873.html
+md5 70ea7bc7bacf1a124b1692605883f620  xset-1.2.4.tar.bz2
+sha1 41a857f30ff5bb0dfbda1549bb703984344ea228  xset-1.2.4.tar.bz2
+sha256 e4fd95280df52a88e9b0abc1fee11dcf0f34fc24041b9f45a247e52df941c957  xset-1.2.4.tar.bz2
+sha512 f24714c9a82081a09d3054bbad98553de9366992f22eaf3e2bcadbb58fad1d3dad2547fef6fa9898d8a9df064573c29df9d82a5c801fa92248604c95f65dc83d  xset-1.2.4.tar.bz2
+# Locally computed
+sha256 6bfc619b6d37dd0e6ca575edcb3a05194136e04d1d9989b8e14e6f7850587382 COPYING
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 157cd229a7..9ead55a20f 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSET_VERSION = 1.2.3
+XAPP_XSET_VERSION = 1.2.4
 XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
 XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSET_LICENSE = MIT
