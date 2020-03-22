From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 15:31:30 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkbcomp: bump version
 to 1.4.3
Message-ID: <20200322142003.A2ABC84273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b6fe17c2d0d31081fee59ea4cc3115c566cface
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash | 8 +++-----
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
index 86fd033e3e..98bd0c43a3 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-June/002901.html
-md5 12610df19df2af3797f2c130ee2bce97  xkbcomp-1.4.2.tar.bz2
-sha1 9a39cf7a562c152465e04fc7cf1002c59f883870  xkbcomp-1.4.2.tar.bz2
-sha256 6dd8bcb9be7e85bd7294abe261b8c7b0539d2fc93e41b80fb8bd013767ce8424  xkbcomp-1.4.2.tar.bz2
-sha512 b00d1eb08c19be86044418c8ea3bfc3c3973406c481878270138a70ed9dab348acb8e4d0af8678879598ffbd7df1c640a63d0abad3d7481758be99af8dd7734e  xkbcomp-1.4.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-February/003037.html
+sha256 06242c169fc11caf601cac46d781d467748c6a330e15b36dce46520b8ac8d435  xkbcomp-1.4.3.tar.bz2
+sha512 827713c0413aecdcad2b61edb7b8c7c7a002e18505b9041f570e2f680907193cb5ff8a5b424695e21110b2d06c145cbf0e397e52347421ee946f06e2a51f135d  xkbcomp-1.4.3.tar.bz2
 # Locally computed
 sha256 f1a78f5796fe2374f2b93e579328a02283e57d2a8316484b31799b12debe7ee3  COPYING
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 9fcd8c0581..e97f8fdd8b 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBCOMP_VERSION = 1.4.2
+XAPP_XKBCOMP_VERSION = 1.4.3
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
