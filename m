From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xcalc: bump version to
 1.0.7
Message-ID: <20190315203119.E322183480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e76205d102eba74f22a2d757028b1c6bbeab9bfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xcalc/xapp_xcalc.hash | 9 +++++++--
 package/x11r7/xapp_xcalc/xapp_xcalc.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.hash b/package/x11r7/xapp_xcalc/xapp_xcalc.hash
index e7967558f8..283fd7e51e 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.hash
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-January/002523.html
-sha256	2f73c7160c09dc32586ea07daa408ac897c0a16eaa98cad9f9e4ee98cd9057d8	xcalc-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002946.html
+md5 c0be45f8c26187474b763d634535d8d8  xcalc-1.0.7.tar.bz2
+sha1 f31c5a9789435b4c5a575d636f1e2ae4f96104c4  xcalc-1.0.7.tar.bz2
+sha256 70d271d1655f90ed0d4011f58022c441e1832f01eb3450c691799b131b557f21  xcalc-1.0.7.tar.bz2
+sha512 890cb9399e3c55816318ab5f0152ddba05ee141cbae6032759a3b762742ab54df8fcf0394dacc539299f93f27cbbb17aee5cbda5dde8b169a7099f20a1a38388  xcalc-1.0.7.tar.bz2
+# Locally computed
+sha256 8dd69dbec37866a41d3040c5c478aca46e0b50c30319f178064d5e2ed9d3f912  COPYING
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index 9445af75e7..5cf3ca653b 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCALC_VERSION = 1.0.6
+XAPP_XCALC_VERSION = 1.0.7
 XAPP_XCALC_SOURCE = xcalc-$(XAPP_XCALC_VERSION).tar.bz2
 XAPP_XCALC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCALC_LICENSE = MIT
