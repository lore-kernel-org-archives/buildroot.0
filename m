From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jun 2019 16:05:20 +0200
Subject: [Buildroot] [PATCH 26/31] package/kodi-pvr-*: mass version bump
In-Reply-To: <20190630140525.6537-1-bernd.kuhls@t-online.de>
References: <20190630140525.6537-1-bernd.kuhls@t-online.de>
Message-ID: <20190630140525.6537-27-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch,
applied upstream.

Removed
kodi-pvr-mediaportal-tvserver/0001-live555-remove-xlocale.h-from-Locale.hh.patch
not needed anymore after PR 81.

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
index 138efa1d05..c98aaf0cb4 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ba9e4d76b9e6d2d879e95eeda0d919ca5eabc0d6f59037f173cd9294b2ce8e4a  kodi-pvr-argustv-2.5.6-Krypton.tar.gz
+sha256 16082de6626f43800ff4cbe87d072f42e7d20e18e693133b2295cbc089a68ba2  kodi-pvr-argustv-d459cba96083c3670d363d35329369789d2aab77.tar.gz
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 2cf4d75293..78d254bb69 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_ARGUSTV_VERSION = 2.5.6-Krypton
+KODI_PVR_ARGUSTV_VERSION = d459cba96083c3670d363d35329369789d2aab77
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index e9b867318d..c5c36e0327 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a45fff0c1fe6d91fd957e2a4e62e9c72a5c36d796c41caa6b1e5a4814f82a503  kodi-pvr-dvblink-3.4.5v2-Krypton.tar.gz
+sha256 a9004577be8070c7301edd4b454022eace3fbe6767cd8424e20f66a0dc3a543f  kodi-pvr-dvblink-71c6e42efaf8b426f0f10130720e1b7c8a0ed49b.tar.gz
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 9860b63b2a..026f52cfa2 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBLINK_VERSION = 3.4.5v2-Krypton
+KODI_PVR_DVBLINK_VERSION = 71c6e42efaf8b426f0f10130720e1b7c8a0ed49b
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 017bd8360a..fc62c1d410 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f1cd26234e33a027d1ef2f3ea7b5f33be3a8aff9a7bf0117ee4bdfcf1e18fd9f  kodi-pvr-dvbviewer-2.4.14-Krypton.tar.gz
+sha256 94ff34834aeadea3539a7aff854330085a278fde61803a4fe8c33a087a9e34f5  kodi-pvr-dvbviewer-a34a66ad38da925fde6cf568ffa24e4a078b035a.tar.gz
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index bc37de7545..96eec18b3f 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBVIEWER_VERSION = 2.4.14-Krypton
+KODI_PVR_DVBVIEWER_VERSION = a34a66ad38da925fde6cf568ffa24e4a078b035a
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 7417b26723..ad5c8a93f6 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0384db9cbcd8ab2e7b8b0eb8c22e8913e734e436234c43d357718c5273058605  kodi-pvr-filmon-1.4.8-Krypton.tar.gz
+sha256 5ea1a7892ddc0d0bc41b394e746c0eccac400348b2dbb2c4e9bba8e52378625a  kodi-pvr-filmon-26ce59103f9314dd3e63f6a3e9ab89dc0b03f310.tar.gz
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index daa3e39dfc..bd4570140f 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_FILMON_VERSION = 1.4.8-Krypton
+KODI_PVR_FILMON_VERSION = 26ce59103f9314dd3e63f6a3e9ab89dc0b03f310
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 8262f4e111..befc57567c 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 3c000b3ebab2b12f5635451f6a71ad01c4f4d7043623cfeebfe6b7c662e026d9  kodi-pvr-hdhomerun-2.4.7-Krypton.tar.gz
+sha256 9a7aeb8413678036290454b12399bda92dac58de7502c0ae1a9e7d6d7816e935  kodi-pvr-hdhomerun-dbbf52e07a419257695dcc53249abb65dce447fc.tar.gz
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index 75fa48764a..3f3055cec1 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HDHOMERUN_VERSION = 2.4.7-Krypton
+KODI_PVR_HDHOMERUN_VERSION = dbbf52e07a419257695dcc53249abb65dce447fc
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 87eafac855..32c3120086 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 96e949526ebf4af542da572e704c0c052ec807408dc0ea65603a15614b889dd1  kodi-pvr-hts-3211941dade740ad92581f488402146794798e74.tar.gz
+sha256 0418d7a40dbb19548333a5569838595f2d8e6ddcfdda16671da241a2b20b7e41  kodi-pvr-hts-d301b2bc2a35403a9e1c960868cf1acfb2ffcb27.tar.gz
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 7f43b04853..971df6bdb2 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HTS_VERSION = 3211941dade740ad92581f488402146794798e74
+KODI_PVR_HTS_VERSION = d301b2bc2a35403a9e1c960868cf1acfb2ffcb27
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 82923a89aa..a1a850a0ae 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 fd60aba0dac25ab5885371495a5dfca53308c1fa23215299b0f62997c7391e1e  kodi-pvr-mythtv-4.15.3.tar.gz
+sha256 0ceb99161fc71a7bf0f2ad7543415306a06bccc11aad13ac5340f2fb16954ae8  kodi-pvr-mythtv-00ec57de53cc04e33f648fba096bacbf484ebc64.tar.gz
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 8099ffae3e..a8efae2c28 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_MYTHTV_VERSION = 4.15.3
+KODI_PVR_MYTHTV_VERSION = 00ec57de53cc04e33f648fba096bacbf484ebc64
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 3d10b5bbec..a1b3a04180 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b126943a6d48ea4d2df38951505f385c2a499e399201eccd798a34076d3c5842  kodi-pvr-nextpvr-2.4.13-Krypton.tar.gz
+sha256 a9a57805d7db597cc6ba172dc554120e51ad3036bc813d2c7613632aeccd6701  kodi-pvr-nextpvr-d02cc70087ce0680a85c19d2babe7fb7402c09a9.tar.gz
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index d0a04991d9..cad9a1dedb 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NEXTPVR_VERSION = 2.4.13-Krypton
+KODI_PVR_NEXTPVR_VERSION = d02cc70087ce0680a85c19d2babe7fb7402c09a9
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index 261558ee3f..d227cd2a94 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 e4e0a6bb1bf0c6f8ae011eba58c5f0ae19a6574bb35fc6a7fbdbb99d20242a2c  kodi-pvr-njoy-2.4.3-Krypton.tar.gz
+sha256 394caa7249df9f26314780036bd000be055cbbb0344ceeea66de6dda3b3243b4  kodi-pvr-njoy-a31e20e5fa9410bdca417f8c70b838048cb68167.tar.gz
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index e946e6783d..d223fbbc3a 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NJOY_VERSION = 2.4.3-Krypton
+KODI_PVR_NJOY_VERSION = a31e20e5fa9410bdca417f8c70b838048cb68167
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 5044806761..68dc6b8adf 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 95f95f39739baf6013bb6c9188743f842f6ba3e1fa541907067f795e1a3c66a1  kodi-pvr-pctv-1.4.7-Krypton.tar.gz
+sha256 1685e34a9e7ff503198303c948fb57f35ab30e6c79593ce8b9efe201a3656b40  kodi-pvr-pctv-09e6f7be3e18c227faa23da71da1cdfc3d38d40a.tar.gz
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 6c7a03049d..8eafafcfaa 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_PCTV_VERSION = 1.4.7-Krypton
+KODI_PVR_PCTV_VERSION = 09e6f7be3e18c227faa23da71da1cdfc3d38d40a
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index 5f2c78f0fa..01684a0f43 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 78065a46b95b3988b1e49fe05da249a1896f54a2c30116a9446f7c4f55db743b  kodi-pvr-vbox-3.6.10-Krypton.tar.gz
+sha256 f1cb399b202717675d8e7a48c45d6d01084e28682a5ca91bd8f528a8fe12fefb  kodi-pvr-vbox-56d18dc1c6a41e38b54172a17255d2fe3173c9a5.tar.gz
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 2c54e14937..e747cf0a3e 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VBOX_VERSION = 3.6.10-Krypton
+KODI_PVR_VBOX_VERSION = 56d18dc1c6a41e38b54172a17255d2fe3173c9a5
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index 6d42583a9b..c51a7a93f0 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b65acb7ade6eaac395ea357158a4aae5ccd141612acfd834b72fbdf8db4e8b0e  kodi-pvr-vdr-vnsi-4ed7d602924dbfcdd2770c0e13423092e829460d.tar.gz
+sha256 4b88144ba3f2a9742bef8058d96f3e3320ab2855a60d8cebba5b5d796d9fa5b4  kodi-pvr-vdr-vnsi-4909f69c089430ab9e151a8641ab316df09f6d90.tar.gz
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index e068641c0d..19da640d78 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VDR_VNSI_VERSION = 4ed7d602924dbfcdd2770c0e13423092e829460d
+KODI_PVR_VDR_VNSI_VERSION = 4909f69c089430ab9e151a8641ab316df09f6d90
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
