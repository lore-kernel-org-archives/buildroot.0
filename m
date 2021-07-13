From: Patrick G. <pgeiem@protonmail.com>
Date: Tue, 13 Jul 2021 08:29:59 +0000
Subject: [Buildroot] [PATCH 1/1] package/gcnano-binaries: bump to version
 6.4.3
Message-ID: <BwTIMG2dlIPHQ8gnD4pEBqu_ZFaAB68eIBIQSL4hBxIKiOBYIy0ZulAnqlLsgHU6CI6a5n2-7gh08GtoLNHmobnYlDbSbmm0ixqkAT33FdA=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/STMicroelectronics/gcnano-binaries/

Signed-off-by: Patrick Gerber <p.gerber@iemgroup.com>
---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index e753f944a3..e3efc82fc5 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 255db9c58627f5f54fd15263647cc97a55927363fec42e7c8d7486170a65d84d  gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed.tar.gz
+sha256 afec2ba2f524821452d561b56afd2fc241293ea4a6e8598d1663f58e5d16800f  gcnano-binaries-1534c3eaabb5ae545a8f97e95f853531365a13fc.tar.gz
 sha256 7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index b27571a08c..c2f5e06702 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################

-GCNANO_BINARIES_LIB_VERSION = 6.2.4
-GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION).p4
-GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION).p4-20190626
-GCNANO_BINARIES_VERSION = c01642ed5e18cf09ecd905af193e935cb3be95ed
+GCNANO_BINARIES_LIB_VERSION = 6.4.3
+GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
+GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20200902
+GCNANO_BINARIES_VERSION = 1534c3eaabb5ae545a8f97e95f853531365a13fc
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))

 GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
@@ -43,7 +43,7 @@ GCNANO_BINARIES_MODULE_MAKE_OPTS = \
 	DEBUG=0

 GCNANO_BINARIES_LIBRARIES = \
-	gbm_viv libEGL libGAL libgbm libGLESv1_CM \
+	libgbm_viv libEGL libGAL libgbm libGLESv1_CM \
 	libGLESv2 libGLSLC libOpenVG libVSC

 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
--
2.27.0
