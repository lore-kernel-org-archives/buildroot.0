From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:02:57 +0100
Subject: [Buildroot] [PATCH 13/28] package/kodi-pvr-*: mass version bump
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-14-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk                           | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                           | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                       | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk                             | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk                                   | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk                     | 2 +-
 package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk                             | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                           | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                                 | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                                 | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk                           | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                                 | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                         | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                             | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                                   | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 0ce333a..89d1b28 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 32f03271cc3fb1b50edfacd2793d5ac70a98dd20
+KODI_PVR_ARGUSTV_VERSION = ff70fe4a8802fbd586fc557dfec448ab0442ad6b
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPLv2+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 88e90c1..7c7193d 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBLINK_VERSION = b87e8a79a329c2f808a5d5abffe05259e365d7e6
+KODI_PVR_DVBLINK_VERSION = dcec4c8d8606f5b25a2e2b79f730e3cede397666
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPLv2+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index 49fc5fc..773a96c 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBVIEWER_VERSION = cbfd4552a4381d289bcfb8eda33699ecfd156bd7
+KODI_PVR_DVBVIEWER_VERSION = 5f32ad56bfc37b7e7dc9e89c1a852f54fc83fd05
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPLv2+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 7e49268..68bafae 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 67abb5696798aa954b38de2cc7b4a74e6554d627
+KODI_PVR_FILMON_VERSION = 0135100f3f2f3e3781ec248205fa20468acdea8e
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPLv2+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index f8b0359..a5927a5 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 016b0b3251d6d5bffaf68baf59010e4347759c4a
+KODI_PVR_HTS_VERSION = 3274354511e970e2101c2aa437001b2f245f80da
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPLv2+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 4d5b9e9..8d3cf92 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 23defebace9a596d549a688c1d017900aeaf7761
+KODI_PVR_IPTVSIMPLE_VERSION = 567eeb3351a7fcefdd39f34fc4e916174c8b75a4
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPLv2+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index bff00c7..9db3ff54 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 29809d10010a21b08b9e652e36bc51dac2171690
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 58a3d3dac67ca85968ca0f09de5a5b0040b67b74
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPLv2+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 76235ea..4806aa3 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 8cb158cebc016f1c2a17014bb21873201ed8957e
+KODI_PVR_MYTHTV_VERSION = f278f65fd7593e031ab8fd36f9ace29d8c6f0263
 KODI_PVR_MYTHTV_SITE = $(call github,kodi-pvr,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPLv2+
 KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 4ec0d80..35e36fd 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 3a205e49b50baba605d3235f6613fdd36c1d3234
+KODI_PVR_NEXTPVR_VERSION = 82462e7333f9d335162b67711a0a761c06d6def2
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPLv2+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index cbc04d5..f446d0d 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NJOY_VERSION = 4f88a097cb62b4604ffb0ac293a5dc8f40885e79
+KODI_PVR_NJOY_VERSION = 7342f9ed339eef0fbd2bc09880af9c99517938b1
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPLv2+
 KODI_PVR_NJOY_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 0cda85a..1985e83 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = bca81657a2879a1ab76404e5b5441e2491f35350
+KODI_PVR_PCTV_VERSION = 8ea856cbcd11f051b0603249309560105d75f8d9
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPLv2+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 979a421..bff9567 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = a89afb8a2f5e01e3d11f6887ba1f7c81aebd7515
+KODI_PVR_STALKER_VERSION = d54e932af60a0292a1059b91e0362c78914e1d55
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPLv2+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 6bb7769..30d4df6 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VBOX_VERSION = 0b1d571f0259583671c9654febf2bf45a8e9920c
+KODI_PVR_VBOX_VERSION = e7eaed5932f66d485aec236d17f06417f8e30229
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPLv2+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index bc482eb..054a73c 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VDR_VNSI_VERSION = 550a4a2e093b4418394cdbe6f72cd7c76f0327b7
+KODI_PVR_VDR_VNSI_VERSION = 927c49c8d6d7f3634617740e0112c124ffeb7c07
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPLv2+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 82569fd..2aae6da 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 96115e9b8898ed6bde36874b43b2fba531cfef5c
+KODI_PVR_VUPLUS_VERSION = e7bc053069f66c025d825213cc8e4832ec7267b4
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPLv2+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index fc385f9..32f8caf 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = e19c3e99c87e81d406bac0bc4e8edeb47df66dcc
+KODI_PVR_WMC_VERSION = 77923a098fbe5d6b7b2ec4d67f59df5ab3e4d64d
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPLv2+
 KODI_PVR_WMC_LICENSE_FILES = src/client.h
-- 
2.7.0
