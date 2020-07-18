From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:20:04 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xev: bump version to
 1.2.4
Message-ID: <20200718134051.BF6DD847AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e531d2e7228853a61b6cf51c3f51810d92de621
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xev/xapp_xev.hash | 10 ++++------
 package/x11r7/xapp_xev/xapp_xev.mk   |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xev/xapp_xev.hash b/package/x11r7/xapp_xev/xapp_xev.hash
index 160e09e4f3..8b9a006c46 100644
--- a/package/x11r7/xapp_xev/xapp_xev.hash
+++ b/package/x11r7/xapp_xev/xapp_xev.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002948.html
-md5 eec82a5d4b599736f0fa637e96136746  xev-1.2.3.tar.bz2
-sha1 3a294934b9e150abc3cccc4182a40ed9b5ea9871  xev-1.2.3.tar.bz2
-sha256 66bc4f1cfa1946d62612737815c34164e4ce40fcebd2c9e1d7e7a1117ad3ad09  xev-1.2.3.tar.bz2
-sha512 47cc7ac096e77cfa4e687914d767263cf3e1dca5bffd0f68c7ba0fe751b248c8a16525bd2da4d6efa0ea8d637831c893d41c9687cace4aaa9c0909a45ef1943e  xev-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-July/003048.html
+sha256  d700e08bfe751ed2dbf802baa204b056d0e49348b6eb3c6f9cb035d8ae4885e2  xev-1.2.4.tar.bz2
+sha512  383472ddbfad639ba46a69080ecdd11a514a0578fd32c463fae18da02e0265c944589eebf12a858994f5fd601c02a0d51517e9b3ff61c6afe740d374f02781ca  xev-1.2.4.tar.bz2
 # Locally computed
-sha256 9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
+sha256  9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 137a6f2050..7d5f3cbb82 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XEV_VERSION = 1.2.3
+XAPP_XEV_VERSION = 1.2.4
 XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
 XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEV_LICENSE = MIT
