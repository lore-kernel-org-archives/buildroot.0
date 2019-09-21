From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:21 +0200
Subject: [Buildroot] [PATCH v6 20/25] package/kodi-pvr-*: mass version bump
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-21-bernd.kuhls@t-online.de>
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
index 138efa1d05..ae03b44467 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ba9e4d76b9e6d2d879e95eeda0d919ca5eabc0d6f59037f173cd9294b2ce8e4a  kodi-pvr-argustv-2.5.6-Krypton.tar.gz
+sha256 aa2526141663fc622e000c4d28e4bb9def907529de3702e7bbcbd9101842b765  kodi-pvr-argustv-7356112d2722a369796fd57883e80480d33e5b35.tar.gz
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 2cf4d75293..a90c32a188 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_ARGUSTV_VERSION = 2.5.6-Krypton
+KODI_PVR_ARGUSTV_VERSION = 7356112d2722a369796fd57883e80480d33e5b35
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index e9b867318d..14b26c82d3 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a45fff0c1fe6d91fd957e2a4e62e9c72a5c36d796c41caa6b1e5a4814f82a503  kodi-pvr-dvblink-3.4.5v2-Krypton.tar.gz
+sha256 6428ab03f91b2a4c45d62b8537338d329954d0c4a551d3a009e8b153672850c7  kodi-pvr-dvblink-715becab1db80704f7b7fc5e4297876fb0f11bad.tar.gz
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 9860b63b2a..1deb4b607d 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBLINK_VERSION = 3.4.5v2-Krypton
+KODI_PVR_DVBLINK_VERSION = 715becab1db80704f7b7fc5e4297876fb0f11bad
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 017bd8360a..b0f7fc1c93 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f1cd26234e33a027d1ef2f3ea7b5f33be3a8aff9a7bf0117ee4bdfcf1e18fd9f  kodi-pvr-dvbviewer-2.4.14-Krypton.tar.gz
+sha256 3f4e467f408e268adbe9d181fd24d3072693e71ef6b4bb3ec15387cdaa063e07  kodi-pvr-dvbviewer-6a38e2c9711200ca95adb7d504806e2097a48d50.tar.gz
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index bc37de7545..58e23a9f46 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBVIEWER_VERSION = 2.4.14-Krypton
+KODI_PVR_DVBVIEWER_VERSION = 6a38e2c9711200ca95adb7d504806e2097a48d50
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 7417b26723..03efb0635e 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0384db9cbcd8ab2e7b8b0eb8c22e8913e734e436234c43d357718c5273058605  kodi-pvr-filmon-1.4.8-Krypton.tar.gz
+sha256 f6245bc2fecf0844a138de4b118e67f69e30d4d3ec3dda7b9ed29296f2989d10  kodi-pvr-filmon-a1abed55c1eb8723de5d6d5dabf545a28944770d.tar.gz
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index daa3e39dfc..f66b7d8b95 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_FILMON_VERSION = 1.4.8-Krypton
+KODI_PVR_FILMON_VERSION = a1abed55c1eb8723de5d6d5dabf545a28944770d
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 8262f4e111..12ce66fd60 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 3c000b3ebab2b12f5635451f6a71ad01c4f4d7043623cfeebfe6b7c662e026d9  kodi-pvr-hdhomerun-2.4.7-Krypton.tar.gz
+sha256 af4e5d114df8b031014d140b463107f54f8ec7adfbd081b0baaecca783415bfa  kodi-pvr-hdhomerun-28b80bc68fe28a956ff0b37becb7552ea6a830a4.tar.gz
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index 75fa48764a..42315da73e 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HDHOMERUN_VERSION = 2.4.7-Krypton
+KODI_PVR_HDHOMERUN_VERSION = 28b80bc68fe28a956ff0b37becb7552ea6a830a4
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 87eafac855..e28d2b0028 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 96e949526ebf4af542da572e704c0c052ec807408dc0ea65603a15614b889dd1  kodi-pvr-hts-3211941dade740ad92581f488402146794798e74.tar.gz
+sha256 8c97f27dae2c0ff42708fc7da6e0ba262b96aedf8e83ffb5e2d6170392ad4047  kodi-pvr-hts-d5488d257efb35ef75aaa47137a839504516e5a1.tar.gz
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 7f43b04853..d7fe320081 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HTS_VERSION = 3211941dade740ad92581f488402146794798e74
+KODI_PVR_HTS_VERSION = d5488d257efb35ef75aaa47137a839504516e5a1
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 82923a89aa..6c2440953b 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 fd60aba0dac25ab5885371495a5dfca53308c1fa23215299b0f62997c7391e1e  kodi-pvr-mythtv-4.15.3.tar.gz
+sha256 877268e5f86d73b05d61affd20a86aea5c3e807f4980a71840784a88ccf35558  kodi-pvr-mythtv-c8b43cc5337fb79ff1237392a0efb39d9a9f7d5c.tar.gz
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 8099ffae3e..7bdcc233df 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_MYTHTV_VERSION = 4.15.3
+KODI_PVR_MYTHTV_VERSION = c8b43cc5337fb79ff1237392a0efb39d9a9f7d5c
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 3d10b5bbec..94e1e7a884 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b126943a6d48ea4d2df38951505f385c2a499e399201eccd798a34076d3c5842  kodi-pvr-nextpvr-2.4.13-Krypton.tar.gz
+sha256 e6456f7bbc0e0810359d3c8edaaf6dc042662651263a81590ff4b844e8a8658e  kodi-pvr-nextpvr-109ad908f400e1c482502231315be855fee42ad5.tar.gz
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index d0a04991d9..fcff6d3ecb 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NEXTPVR_VERSION = 2.4.13-Krypton
+KODI_PVR_NEXTPVR_VERSION = 109ad908f400e1c482502231315be855fee42ad5
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index 261558ee3f..7d328a590c 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 e4e0a6bb1bf0c6f8ae011eba58c5f0ae19a6574bb35fc6a7fbdbb99d20242a2c  kodi-pvr-njoy-2.4.3-Krypton.tar.gz
+sha256 f54e3e5bb1f26b9d871fd91bf185f04573efb7758bcdbb451bf50663cda329ec  kodi-pvr-njoy-61b2ea953f881356ed9faa3f9b7b86714f8393d8.tar.gz
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index e946e6783d..6ee02678a6 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NJOY_VERSION = 2.4.3-Krypton
+KODI_PVR_NJOY_VERSION = 61b2ea953f881356ed9faa3f9b7b86714f8393d8
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 5044806761..74e63407ab 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 95f95f39739baf6013bb6c9188743f842f6ba3e1fa541907067f795e1a3c66a1  kodi-pvr-pctv-1.4.7-Krypton.tar.gz
+sha256 e1466066c537365aeb3931da9d2516b7c89f782565834eef25bd39705c50fe02  kodi-pvr-pctv-a980f77dd0240ee1d18ba26d521a133b7dac46d4.tar.gz
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 6c7a03049d..118d4d3cc3 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_PCTV_VERSION = 1.4.7-Krypton
+KODI_PVR_PCTV_VERSION = a980f77dd0240ee1d18ba26d521a133b7dac46d4
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index 5f2c78f0fa..b11dc90f00 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 78065a46b95b3988b1e49fe05da249a1896f54a2c30116a9446f7c4f55db743b  kodi-pvr-vbox-3.6.10-Krypton.tar.gz
+sha256 861ddf9860d16dc3af532639fe9a97cddad27089b19ea7de316d7c0fabf613c2  kodi-pvr-vbox-05803ff120a75747c1c354199ba49b911cb76c0f.tar.gz
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 2c54e14937..9fa0df034f 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VBOX_VERSION = 3.6.10-Krypton
+KODI_PVR_VBOX_VERSION = 05803ff120a75747c1c354199ba49b911cb76c0f
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index 6d42583a9b..1cfb3bfe38 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b65acb7ade6eaac395ea357158a4aae5ccd141612acfd834b72fbdf8db4e8b0e  kodi-pvr-vdr-vnsi-4ed7d602924dbfcdd2770c0e13423092e829460d.tar.gz
+sha256 9835c442fc828e9deebb28ebcb07f66e0f18a0ba5f8c0def110b9f10b8af5471  kodi-pvr-vdr-vnsi-425f18a255a9ba443dabb5ffe769ecb546595451.tar.gz
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index e068641c0d..615cac42e7 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VDR_VNSI_VERSION = 4ed7d602924dbfcdd2770c0e13423092e829460d
+KODI_PVR_VDR_VNSI_VERSION = 425f18a255a9ba443dabb5ffe769ecb546595451
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 4c050fb654..c0708f2a30 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7f5dfb88f54d511d575b7aabd94e1a862afb7e8a0b89fa957db6a135c31846eb  kodi-pvr-wmc-1.4.9v2-Krypton.tar.gz
+sha256 1ce94bdca4c925a4aa3cc454878aa8c55296a9e8afdbc25cb42644d66256d6b8  kodi-pvr-wmc-306f2d80b29b1c9abb759c6c74339c4a7793994d.tar.gz
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index b6e3d43256..4f43942070 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_WMC_VERSION = 1.4.9v2-Krypton
+KODI_PVR_WMC_VERSION = 306f2d80b29b1c9abb759c6c74339c4a7793994d
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = src/client.h
-- 
2.20.1
