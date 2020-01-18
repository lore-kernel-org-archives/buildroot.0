From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Jan 2020 21:06:13 +0100
Subject: [Buildroot] [PATCH v8 13/20] package/kodi-pvr-*: mass version bump
In-Reply-To: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
Message-ID: <20200118200620.3967240-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash     | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk       | 4 +---
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash     | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk       | 4 +---
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   | 4 +---
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash       | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk         | 4 +---
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   | 4 +---
 package/kodi-pvr-hts/kodi-pvr-hts.hash             | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk               | 4 +---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash       | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk         | 4 +---
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash     | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk       | 4 +---
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash           | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk             | 4 +---
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash           | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk             | 4 +---
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash           | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk             | 4 +---
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash   | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk     | 4 +---
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash             | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk               | 4 +---
 26 files changed, 26 insertions(+), 52 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index 138efa1d05..2eae694354 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ba9e4d76b9e6d2d879e95eeda0d919ca5eabc0d6f59037f173cd9294b2ce8e4a  kodi-pvr-argustv-2.5.6-Krypton.tar.gz
+sha256 2d0fae3721715a17e1c1454dd7029eb8d18e7f761ed65e00f8c488c7c08433e8  kodi-pvr-argustv-3.5.4-Leia.tar.gz
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 2cf4d75293..f59f4467ab 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_ARGUSTV_VERSION = 2.5.6-Krypton
+KODI_PVR_ARGUSTV_VERSION = 3.5.4-Leia
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index e9b867318d..d49a267b0f 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a45fff0c1fe6d91fd957e2a4e62e9c72a5c36d796c41caa6b1e5a4814f82a503  kodi-pvr-dvblink-3.4.5v2-Krypton.tar.gz
+sha256 ad7586abfe7b3f9dd67b3a2225c442fc8d2a442e48bd7df75b11652286392c2f  kodi-pvr-dvblink-4.7.2-Leia.tar.gz
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 9860b63b2a..423faf7633 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBLINK_VERSION = 3.4.5v2-Krypton
+KODI_PVR_DVBLINK_VERSION = 4.7.2-Leia
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 017bd8360a..726def6dfe 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f1cd26234e33a027d1ef2f3ea7b5f33be3a8aff9a7bf0117ee4bdfcf1e18fd9f  kodi-pvr-dvbviewer-2.4.14-Krypton.tar.gz
+sha256 8a3d167e652574caf30ba0ce9c22d278715e0237774b817e37826f1b2d647bff  kodi-pvr-dvbviewer-3.7.11-Leia.tar.gz
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index bc37de7545..4c221c012f 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBVIEWER_VERSION = 2.4.14-Krypton
+KODI_PVR_DVBVIEWER_VERSION = 3.7.11-Leia
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 7417b26723..8f15870dbc 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0384db9cbcd8ab2e7b8b0eb8c22e8913e734e436234c43d357718c5273058605  kodi-pvr-filmon-1.4.8-Krypton.tar.gz
+sha256 763500fb4a7210569f05dba8307d400e532dd0e72b24f1a1d2cd516695145190  kodi-pvr-filmon-2.4.4-Leia.tar.gz
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index daa3e39dfc..44f13909fa 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_FILMON_VERSION = 1.4.8-Krypton
+KODI_PVR_FILMON_VERSION = 2.4.4-Leia
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 8262f4e111..86a512dc0f 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 3c000b3ebab2b12f5635451f6a71ad01c4f4d7043623cfeebfe6b7c662e026d9  kodi-pvr-hdhomerun-2.4.7-Krypton.tar.gz
+sha256 815ba3dfbe6e1318226d41879057f0b8a4f0ac960d12ebc5d69f0a1ac28cfa09  kodi-pvr-hdhomerun-3.5.0-Leia.tar.gz
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index 75fa48764a..6e6dd4dfaa 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HDHOMERUN_VERSION = 2.4.7-Krypton
+KODI_PVR_HDHOMERUN_VERSION = 3.5.0-Leia
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 87eafac855..dc45e829ea 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 96e949526ebf4af542da572e704c0c052ec807408dc0ea65603a15614b889dd1  kodi-pvr-hts-3211941dade740ad92581f488402146794798e74.tar.gz
+sha256 fcf2df3566b196addf99d8166fa5a8b77635ac905214c36071d9e778cc42978e  kodi-pvr-hts-4.4.20-Leia.tar.gz
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 7f43b04853..0184f77ec9 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HTS_VERSION = 3211941dade740ad92581f488402146794798e74
+KODI_PVR_HTS_VERSION = 4.4.20-Leia
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 82923a89aa..4de1fda3fa 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 fd60aba0dac25ab5885371495a5dfca53308c1fa23215299b0f62997c7391e1e  kodi-pvr-mythtv-4.15.3.tar.gz
+sha256 36d9142e0e19b904e1c4a6d8cd67063d291e63971f80a98a6f24b7f4554bb2e3  kodi-pvr-mythtv-5.10.15-Leia.tar.gz
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 8099ffae3e..e644f9bc7f 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_MYTHTV_VERSION = 4.15.3
+KODI_PVR_MYTHTV_VERSION = 5.10.15-Leia
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 3d10b5bbec..86e77b3281 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b126943a6d48ea4d2df38951505f385c2a499e399201eccd798a34076d3c5842  kodi-pvr-nextpvr-2.4.13-Krypton.tar.gz
+sha256 f7b6ea2e79e469fc265d008d3ba8ebb7e286e789a8b4bc809681a254ff225775  kodi-pvr-nextpvr-3.3.18-Leia.tar.gz
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index d0a04991d9..059430ebb4 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NEXTPVR_VERSION = 2.4.13-Krypton
+KODI_PVR_NEXTPVR_VERSION = 3.3.18-Leia
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index 261558ee3f..00aa98d9b6 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 e4e0a6bb1bf0c6f8ae011eba58c5f0ae19a6574bb35fc6a7fbdbb99d20242a2c  kodi-pvr-njoy-2.4.3-Krypton.tar.gz
+sha256 8c42a3c3754d7a07de9682504c4883a584eb21a92b9af70f0129ffc2707c1554  kodi-pvr-njoy-3.4.2-Leia.tar.gz
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index e946e6783d..1099e66212 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NJOY_VERSION = 2.4.3-Krypton
+KODI_PVR_NJOY_VERSION = 3.4.2-Leia
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 5044806761..bcf920aabf 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 95f95f39739baf6013bb6c9188743f842f6ba3e1fa541907067f795e1a3c66a1  kodi-pvr-pctv-1.4.7-Krypton.tar.gz
+sha256 a9f1c5596786cf4cfa279d0b4477839ef7f5bb7267c65152dbcf7ae0bda56679  kodi-pvr-pctv-2.4.5-Leia.tar.gz
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 6c7a03049d..014d1d3f97 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_PCTV_VERSION = 1.4.7-Krypton
+KODI_PVR_PCTV_VERSION = 2.4.5-Leia
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index 5f2c78f0fa..92ebd9ee0f 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 78065a46b95b3988b1e49fe05da249a1896f54a2c30116a9446f7c4f55db743b  kodi-pvr-vbox-3.6.10-Krypton.tar.gz
+sha256 98aadcf3d0109a7dc5f85b4e5473d595039b59c46b0686a2fbda88ff7631ee0c  kodi-pvr-vbox-4.7.0-Leia.tar.gz
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 2c54e14937..8c8382a1d2 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VBOX_VERSION = 3.6.10-Krypton
+KODI_PVR_VBOX_VERSION = 4.7.0-Leia
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index 6d42583a9b..8d03a823ee 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b65acb7ade6eaac395ea357158a4aae5ccd141612acfd834b72fbdf8db4e8b0e  kodi-pvr-vdr-vnsi-4ed7d602924dbfcdd2770c0e13423092e829460d.tar.gz
+sha256 6afaf1f3f1e0670edb9dc01581a0d6c3f57502c791e19283eb63807e8936a768  kodi-pvr-vdr-vnsi-3.6.3-Leia.tar.gz
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index e068641c0d..ec8fc7fc76 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VDR_VNSI_VERSION = 4ed7d602924dbfcdd2770c0e13423092e829460d
+KODI_PVR_VDR_VNSI_VERSION = 3.6.3-Leia
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 4c050fb654..0707ce5839 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7f5dfb88f54d511d575b7aabd94e1a862afb7e8a0b89fa957db6a135c31846eb  kodi-pvr-wmc-1.4.9v2-Krypton.tar.gz
+sha256 4cb81f29cba23172d042e50bbab00cd64cd5670ad7350fd9d25301f63178e5f7  kodi-pvr-wmc-2.4.5-Leia.tar.gz
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index b6e3d43256..82397163fe 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_WMC_VERSION = 1.4.9v2-Krypton
+KODI_PVR_WMC_VERSION = 2.4.5-Leia
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = src/client.h
-- 
2.20.1
