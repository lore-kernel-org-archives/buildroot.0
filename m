From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 23:13:51 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkbcomp: bump version
 to 1.4.2
Message-ID: <20180725210911.30BB27FEA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32ff94ece13ef14f102a0f55af74c27762f54824
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash | 10 +++++-----
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
index 56631411d4..86fd033e3e 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002843.html
-md5 07df9790d30f9a369d20a418af784de0  xkbcomp-1.4.1.tar.bz2
-sha1 e7585cdb357b9d20c8f3c8a9d06f7e897934a772  xkbcomp-1.4.1.tar.bz2
-sha256 748dc4cf58ac95684106bd9cf163ac6ab7de9a236faec02a6f4d4006d63a5736  xkbcomp-1.4.1.tar.bz2
-sha512 443397e112f67e2ebc5150ec0dbf0f4a072ea39585d964d2c7cbd0569b7e0ce7d8bed0bc2c2d886343fdb060c941e65b42aac16adf189c66e90849029e278f23  xkbcomp-1.4.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-June/002901.html
+md5 12610df19df2af3797f2c130ee2bce97  xkbcomp-1.4.2.tar.bz2
+sha1 9a39cf7a562c152465e04fc7cf1002c59f883870  xkbcomp-1.4.2.tar.bz2
+sha256 6dd8bcb9be7e85bd7294abe261b8c7b0539d2fc93e41b80fb8bd013767ce8424  xkbcomp-1.4.2.tar.bz2
+sha512 b00d1eb08c19be86044418c8ea3bfc3c3973406c481878270138a70ed9dab348acb8e4d0af8678879598ffbd7df1c640a63d0abad3d7481758be99af8dd7734e  xkbcomp-1.4.2.tar.bz2
 # Locally computed
 sha256 f1a78f5796fe2374f2b93e579328a02283e57d2a8316484b31799b12debe7ee3  COPYING
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 369e1f3fe3..9fcd8c0581 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBCOMP_VERSION = 1.4.1
+XAPP_XKBCOMP_VERSION = 1.4.2
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
