From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2020 12:21:27 +0100
Subject: [Buildroot] [PATCH/next 2/6] package/x11r7/xapp_xkbcomp: bump
 version to 1.4.4
In-Reply-To: <20201121112131.756930-1-bernd.kuhls@t-online.de>
References: <20201121112131.756930-1-bernd.kuhls@t-online.de>
Message-ID: <20201121112131.756930-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash | 8 ++++----
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
index 98bd0c43a3..7191d5520e 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-February/003037.html
-sha256 06242c169fc11caf601cac46d781d467748c6a330e15b36dce46520b8ac8d435  xkbcomp-1.4.3.tar.bz2
-sha512 827713c0413aecdcad2b61edb7b8c7c7a002e18505b9041f570e2f680907193cb5ff8a5b424695e21110b2d06c145cbf0e397e52347421ee946f06e2a51f135d  xkbcomp-1.4.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-November/003063.html
+sha256  59cce603a607a17722a0a1cf99010f4894e7812beb5d695abbc08474d59af27e  xkbcomp-1.4.4.tar.bz2
+sha512  971eb06277a49083b42154472596f1452fa94cdee28bad345bbcd85b028441bfd975763c20ed92aa69d6605b3fb23d27fee89df91501963b77c863667bae41c4  xkbcomp-1.4.4.tar.bz2
 # Locally computed
-sha256 f1a78f5796fe2374f2b93e579328a02283e57d2a8316484b31799b12debe7ee3  COPYING
+sha256  f1a78f5796fe2374f2b93e579328a02283e57d2a8316484b31799b12debe7ee3  COPYING
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index e97f8fdd8b..69d4aefb94 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBCOMP_VERSION = 1.4.3
+XAPP_XKBCOMP_VERSION = 1.4.4
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
-- 
2.27.0
