From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Sep 2014 09:46:45 +0200
Subject: [Buildroot] [git commit] package: normalize separator size to 80
Message-ID: <20140925075214.CF0409D782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f8ae3c45f3143aef5143cd9a8ec63c61ae59ece
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/espeak/espeak.mk       |    4 ++--
 package/fmc/fmc.mk             |    4 ++--
 package/fmlib/fmlib.mk         |    4 ++--
 package/librtlsdr/librtlsdr.mk |    4 ++--
 package/simicsfs/simicsfs.mk   |    4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index 9c32752..9a83d4f 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # espeak
 #
-###############################################################################
+################################################################################
 
 ESPEAK_VERSION_MAJOR = 1.48
 ESPEAK_VERSION = $(ESPEAK_VERSION_MAJOR).04
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index f9091c0..49c5fe8 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # fmc
 #
-###############################################################################
+################################################################################
 
 FMC_VERSION = fsl-sdk-v1.5-rc3
 FMC_SITE = git://git.freescale.com/ppc/sdk/fmc.git
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 8fca0cd..f8698a4 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fmlib
 #
-#############################################################
+################################################################################
 
 FMLIB_VERSION = fsl-sdk-v1.5-rc3
 FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index 985614a..aa3d0c1 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -1,8 +1,8 @@
-##########################################################################
+################################################################################
 #
 # librtlsdr
 #
-##########################################################################
+################################################################################
 
 LIBRTLSDR_VERSION = v0.5.3
 LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
diff --git a/package/simicsfs/simicsfs.mk b/package/simicsfs/simicsfs.mk
index 99dda84..34061ff 100644
--- a/package/simicsfs/simicsfs.mk
+++ b/package/simicsfs/simicsfs.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # simicsfs
 #
-###############################################################################
+################################################################################
 
 SIMICSFS_VERSION = 1.18
 SIMICSFS_SITE = http://download.simics.net/pub
