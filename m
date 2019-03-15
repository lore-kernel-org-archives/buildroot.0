From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmore: bump version to
 1.0.3
Message-ID: <20190315203120.3C59083480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7340438ee43621900be7b79551f4c4a40a6818a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xmore/xapp_xmore.hash | 9 +++++++--
 package/x11r7/xapp_xmore/xapp_xmore.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xmore/xapp_xmore.hash b/package/x11r7/xapp_xmore/xapp_xmore.hash
index f2b7d1a694..cd777831fa 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.hash
+++ b/package/x11r7/xapp_xmore/xapp_xmore.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2010-July/001360.html
-sha1	7db4e5feb82d5d05038722d3af00d28e103bed18	xmore-1.0.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002964.html
+md5 8e1279352192e4142740c21db58f9be9  xmore-1.0.3.tar.bz2
+sha1 b57b92afd783d28c4c505e0c95556939f24c3ec9  xmore-1.0.3.tar.bz2
+sha256 644a1e0d5182d7708d413722d0579a587dc56b9a8cb60640df076d302e09251b  xmore-1.0.3.tar.bz2
+sha512 e3e44831cd87a54bb585f80ef0d87f69dc35f6c834a73241aad9f6e2b0999b53c51a0a3f915a94ae4d6dc9bdfb9f60b6576f0bdcec441443abd98efa6c51b1d3  xmore-1.0.3.tar.bz2
+# Locally computed
+sha256 27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index b0b0edf23b..f8a3ba8c1f 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMORE_VERSION = 1.0.2
+XAPP_XMORE_VERSION = 1.0.3
 XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
 XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMORE_LICENSE = MIT
