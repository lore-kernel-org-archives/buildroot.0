From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Feb 2020 12:13:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-*: mass update of license
 files
Message-ID: <20200216111309.792904-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch _LICENSE_FILES to debian/copyright instead of using a source
code file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash                  | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk                    | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash                  | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                    | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash              | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash                    | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk                      | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash              | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk                | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.hash                          | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk                            | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash            | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk              | 2 +-
 .../kodi-pvr-mediaportal-tvserver.hash                          | 2 +-
 .../kodi-pvr-mediaportal-tvserver.mk                            | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash                    | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk                      | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash                  | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                    | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash                        | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                          | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash                        | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                          | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash                  | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk                    | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash                        | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                          | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash                | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                  | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                    | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                      | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                          | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                            | 2 +-
 34 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index 1568f4b083..e9d3684b2f 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 2d0fae3721715a17e1c1454dd7029eb8d18e7f761ed65e00f8c488c7c08433e8  kodi-pvr-argustv-3.5.4-Leia.tar.gz
-sha256 9a5b69143f47289e5d649a78a0f0aaf21a75fa8866bd2b8c6c559e57cd221295  src/client.h
+sha256 17bc5450fff10fc46484886690adbf20c369f5baff021435feab1187b9943834  debian/copyright
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index f59f4467ab..b82a6f52d0 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -7,7 +7,7 @@
 KODI_PVR_ARGUSTV_VERSION = 3.5.4-Leia
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
-KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
+KODI_PVR_ARGUSTV_LICENSE_FILES = debian/copyright
 KODI_PVR_ARGUSTV_DEPENDENCIES = jsoncpp kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index 4bec77ddc5..c07f227809 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 ad7586abfe7b3f9dd67b3a2225c442fc8d2a442e48bd7df75b11652286392c2f  kodi-pvr-dvblink-4.7.2-Leia.tar.gz
-sha256 2a643b774c0b5238ff2d284bad43ec69c2ad4b848b6c58a73dbabffa55d62bfe  src/client.h
+sha256 4200fb35edb052f04dc43d267a1ad59468cb899e7b4931756b5830039b82716d  debian/copyright
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 423faf7633..95bc7bbb4b 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -7,7 +7,7 @@
 KODI_PVR_DVBLINK_VERSION = 4.7.2-Leia
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
-KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
+KODI_PVR_DVBLINK_LICENSE_FILES = debian/copyright
 KODI_PVR_DVBLINK_DEPENDENCIES = kodi-platform tinyxml2
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index f63f907145..642f93f71c 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 8a3d167e652574caf30ba0ce9c22d278715e0237774b817e37826f1b2d647bff  kodi-pvr-dvbviewer-3.7.11-Leia.tar.gz
-sha256 d60190aad6c2e704c7ef51693afec2530a54e357ed217313570004cc59c9a4d8  src/client.h
+sha256 5757dbd6a8731e9395508cd7ab9ca0ea0c2863a7aac7136299d40549c88c9c2c  debian/copyright
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index 4c221c012f..b88d3d86cd 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -7,7 +7,7 @@
 KODI_PVR_DVBVIEWER_VERSION = 3.7.11-Leia
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
-KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
+KODI_PVR_DVBVIEWER_LICENSE_FILES = debian/copyright
 KODI_PVR_DVBVIEWER_DEPENDENCIES = kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index ad777e5388..947c81d2e6 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 763500fb4a7210569f05dba8307d400e532dd0e72b24f1a1d2cd516695145190  kodi-pvr-filmon-2.4.4-Leia.tar.gz
-sha256 8300bc67ff10aad7f271e96f867ad024fcdfc114caca04fefa437231945e6315  src/client.h
+sha256 081907693b03f27cb1b17e0a440ae05fd8c8b4631be6fe6fdba4e18a5d40fdc5  debian/copyright
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 44f13909fa..0ee910db9f 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -7,7 +7,7 @@
 KODI_PVR_FILMON_VERSION = 2.4.4-Leia
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
-KODI_PVR_FILMON_LICENSE_FILES = src/client.h
+KODI_PVR_FILMON_LICENSE_FILES = debian/copyright
 KODI_PVR_FILMON_DEPENDENCIES = jsoncpp kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 1bc71c06f7..3e76af00ed 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 815ba3dfbe6e1318226d41879057f0b8a4f0ac960d12ebc5d69f0a1ac28cfa09  kodi-pvr-hdhomerun-3.5.0-Leia.tar.gz
-sha256 b184cd8a52f77f6c02c1da89dfc17dff989c50c400acab10148ab77f02723d84  src/client.h
+sha256 9e76c8ce9e201f75c50c755982b9e2f15821280dedc5e953f685086912e1e39d  debian/copyright
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index 6e6dd4dfaa..ae42f5c33d 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -7,7 +7,7 @@
 KODI_PVR_HDHOMERUN_VERSION = 3.5.0-Leia
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
-KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
+KODI_PVR_HDHOMERUN_LICENSE_FILES = debian/copyright
 KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi-platform libhdhomerun
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index ffbe368637..878e25b2b7 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 fcf2df3566b196addf99d8166fa5a8b77635ac905214c36071d9e778cc42978e  kodi-pvr-hts-4.4.20-Leia.tar.gz
-sha256 a6cd848443278bf312680e08d13fa898e4242fd76de8c86aea5f09a51826885c  src/client.h
+sha256 6d97c3d608a5d59565b567313bd3e53a1d0066ed59f4ae8e474c895d0c20e746  debian/copyright
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 0184f77ec9..0268439824 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -7,7 +7,7 @@
 KODI_PVR_HTS_VERSION = 4.4.20-Leia
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
-KODI_PVR_HTS_LICENSE_FILES = src/client.h
+KODI_PVR_HTS_LICENSE_FILES = debian/copyright
 KODI_PVR_HTS_DEPENDENCIES = kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 38e8571380..ba65640555 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 25eff252ad748e0cf166cd01b0f08e8fb3977c98a1b04cad9ef6509ea30c5fa9  kodi-pvr-iptvsimple-3.8.8-Leia.tar.gz
-sha256 f5890f1869491e6e6674029355d40b1f4cf57f065da4f37d5b1b3d2dd41ba092  src/client.h
+sha256 50e33ec3cddb75e6c5c5eb1b3d38cc0adee7dec71d7244925106d4a2c4d5e31d  debian/copyright
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 16007cf404..f9b384ba92 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -7,7 +7,7 @@
 KODI_PVR_IPTVSIMPLE_VERSION = 3.8.8-Leia
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
-KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
+KODI_PVR_IPTVSIMPLE_LICENSE_FILES = debian/copyright
 KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform rapidxml
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index ce24491ec6..84526b7461 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 9c05578566f7448dc3a7677587c804596aa314afd493cb9c62cc65ea883645aa  kodi-pvr-mediaportal-tvserver-3.5.18-Leia.tar.gz
-sha256 b9966d774c89672efb8d6501d636038a77888c044d15e68af604e9366c1b1a0a  src/client.h
+sha256 f9df5b0c11a23b2d5ca84828c67412ecd8752df46527285aeff48f4d7988d367  debian/copyright
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index 1b6ad39ef1..a00711c662 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -7,7 +7,7 @@
 KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 3.5.18-Leia
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
-KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/client.h
+KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = debian/copyright
 KODI_PVR_MEDIAPORTAL_TVSERVER_DEPENDENCIES = kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index a8aaef631c..c70e032289 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 36d9142e0e19b904e1c4a6d8cd67063d291e63971f80a98a6f24b7f4554bb2e3  kodi-pvr-mythtv-5.10.15-Leia.tar.gz
-sha256 ca8fee175b3a02d106870b991ed29b07dfc5024ce3992bbb872d0654467f132b  src/client.h
+sha256 0efb11009d447b39ec35d77dc265db3d1c3d261730bbc33b267587254d973ec8  debian/copyright
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index e644f9bc7f..b89db3a455 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -7,7 +7,7 @@
 KODI_PVR_MYTHTV_VERSION = 5.10.15-Leia
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
-KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
+KODI_PVR_MYTHTV_LICENSE_FILES = debian/copyright
 KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 28bad5fcae..2ebadf55b9 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 f7b6ea2e79e469fc265d008d3ba8ebb7e286e789a8b4bc809681a254ff225775  kodi-pvr-nextpvr-3.3.18-Leia.tar.gz
-sha256 71c90cfb2792702a6bc13dd10e34c2f181b5e923ab4ae2b1b0674c5b8867b2ad  src/client.h
+sha256 0bd576badce05c6b4315c415dabd77d80c871e72026c399f7a7bb8582e0911fe  debian/copyright
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 059430ebb4..a4ca198310 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -7,7 +7,7 @@
 KODI_PVR_NEXTPVR_VERSION = 3.3.18-Leia
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
-KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
+KODI_PVR_NEXTPVR_LICENSE_FILES = debian/copyright
 KODI_PVR_NEXTPVR_DEPENDENCIES = kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index 472dc78624..cf23a3abaa 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 8c42a3c3754d7a07de9682504c4883a584eb21a92b9af70f0129ffc2707c1554  kodi-pvr-njoy-3.4.2-Leia.tar.gz
-sha256 69e4681abe815ce2f3ec2c9f34c2292e95e56424d9403fe91a91baeb23e91ec0  src/client.h
+sha256 9d42154eabd84ae131cc6384a3ea0fc622c3551595564bec7a6bec8df4a57fbd  debian/copyright
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index 1099e66212..ca86d46d85 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -7,7 +7,7 @@
 KODI_PVR_NJOY_VERSION = 3.4.2-Leia
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
-KODI_PVR_NJOY_LICENSE_FILES = src/client.h
+KODI_PVR_NJOY_LICENSE_FILES = debian/copyright
 KODI_PVR_NJOY_DEPENDENCIES = kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 850ca7ac77..f1bb8a4804 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 a9f1c5596786cf4cfa279d0b4477839ef7f5bb7267c65152dbcf7ae0bda56679  kodi-pvr-pctv-2.4.5-Leia.tar.gz
-sha256 03798669132b75111ef5731f6f9c5e519faf088fe4ef3233289bc140e26d2845  src/client.h
+sha256 43376e70ae80133530c8ce71a3b0dcde8529a8162d3b3956009eb8fc0f5c559c  debian/copyright
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 014d1d3f97..45c916df49 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -7,7 +7,7 @@
 KODI_PVR_PCTV_VERSION = 2.4.5-Leia
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
-KODI_PVR_PCTV_LICENSE_FILES = src/client.h
+KODI_PVR_PCTV_LICENSE_FILES = debian/copyright
 KODI_PVR_PCTV_DEPENDENCIES = jsoncpp kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index 4db4f79745..720689dc43 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 03eb428f21d6b8526b6671278b60ac6dc5a761a515af27172d8ac5c814cc3f65  kodi-pvr-stalker-3.4.10-Leia.tar.gz
-sha256 31d746afd12ac7ebcbc2a4b525de77d31d10bc4f7a0a45830d6f899a2953bc95  src/client.h
+sha256 f9fa34b2caa07376a7a976c1f0b1b9761b37449afd4ceb1e7afa283492054237  debian/copyright
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 1b1592320c..0ae41171a9 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -7,7 +7,7 @@
 KODI_PVR_STALKER_VERSION = 3.4.10-Leia
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
-KODI_PVR_STALKER_LICENSE_FILES = src/client.h
+KODI_PVR_STALKER_LICENSE_FILES = debian/copyright
 KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi-platform libxml2
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index 42fee0b5ae..a3c624526e 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 98aadcf3d0109a7dc5f85b4e5473d595039b59c46b0686a2fbda88ff7631ee0c  kodi-pvr-vbox-4.7.0-Leia.tar.gz
-sha256 d50cada312480496eeb901e1809cfadaea256f82359d2cb01ae44f28e2191b33  src/client.h
+sha256 f535b79e33bdf4d270f8aed3fdcb92f807981f808d7f5e3c053c088e5ccf553b  debian/copyright
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 8c8382a1d2..b10bfc5b85 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -7,7 +7,7 @@
 KODI_PVR_VBOX_VERSION = 4.7.0-Leia
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
-KODI_PVR_VBOX_LICENSE_FILES = src/client.h
+KODI_PVR_VBOX_LICENSE_FILES = debian/copyright
 KODI_PVR_VBOX_DEPENDENCIES = kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index c0e1d90bfa..12a2768fae 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 6afaf1f3f1e0670edb9dc01581a0d6c3f57502c791e19283eb63807e8936a768  kodi-pvr-vdr-vnsi-3.6.3-Leia.tar.gz
-sha256 4da4a184b215913b33f48ee26990b34daa7a15e00cc23e60975d391b7168597b  src/client.h
+sha256 28266596fdf4162d4f15985e0108cd9ddb42531ddad2297011649c1af49f7fe2  debian/copyright
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index ec8fc7fc76..3dbb24ce0e 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -7,7 +7,7 @@
 KODI_PVR_VDR_VNSI_VERSION = 3.6.3-Leia
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
-KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
+KODI_PVR_VDR_VNSI_LICENSE_FILES = debian/copyright
 KODI_PVR_VDR_VNSI_DEPENDENCIES = kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index a8f81244f2..bd7f865486 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 d7dd890e4491e211ff3781cdc043347ab7a4ef6e00619ac1b4641ed81b0c3626  kodi-pvr-vuplus-3.28.9-Leia.tar.gz
-sha256 21f5b12ef73285dbf9709fd42b719b719285a7e8a6741913664b58b8e08374c8  src/client.h
+sha256 e98518889de8d38eaa6ddcb086b6e3b86efed98b501a5c666b9cf48f79e6df5d  debian/copyright
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 34ec5d2384..bf1de1178d 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -7,7 +7,7 @@
 KODI_PVR_VUPLUS_VERSION = 3.28.9-Leia
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
-KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
+KODI_PVR_VUPLUS_LICENSE_FILES = debian/copyright
 KODI_PVR_VUPLUS_DEPENDENCIES = json-for-modern-cpp kodi-platform tinyxml
 
 $(eval $(cmake-package))
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 643549ea73..e72e8d20a9 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 4cb81f29cba23172d042e50bbab00cd64cd5670ad7350fd9d25301f63178e5f7  kodi-pvr-wmc-2.4.5-Leia.tar.gz
-sha256 1a2f68003a1149b6f6480f4cc749089aed8cbf16529300cc8458c5c7925ce917  src/client.h
+sha256 6d97c3d608a5d59565b567313bd3e53a1d0066ed59f4ae8e474c895d0c20e746  debian/copyright
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 82397163fe..d669768e7e 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -7,7 +7,7 @@
 KODI_PVR_WMC_VERSION = 2.4.5-Leia
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
-KODI_PVR_WMC_LICENSE_FILES = src/client.h
+KODI_PVR_WMC_LICENSE_FILES = debian/copyright
 KODI_PVR_WMC_DEPENDENCIES = kodi-platform
 
 $(eval $(cmake-package))
-- 
2.20.1
